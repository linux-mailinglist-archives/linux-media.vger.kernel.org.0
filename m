Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00DA21B99B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 17:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgGJPdb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 11:33:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50860 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgGJPdb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 11:33:31 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F08102C0;
        Fri, 10 Jul 2020 17:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594395209;
        bh=iSSYMnViY3EN/FqLX8wvFPuP3XzFOddYdTJRUEr58yg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iwA1CNdK7L1rw/Nmo2I9Dqxyh1cFBkHjZIVXAL47UNfx0HN9b0WawpTje+4MrL9bx
         5BDpMpeWV/yE1/Soc70ss9++tOOzr6WO/jHSDv9GAeTK33ikAlhec0v1QmXi1YekCS
         Z7+KiVr/s7grtCuWQxjqIeOve7VCOOZWFw4dhg4I=
Date:   Fri, 10 Jul 2020 18:33:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 2/6] v4l2-ctl: Add version command
Message-ID: <20200710153322.GC5964@pendragon.ideasonboard.com>
References: <20200710152858.486326-1-paul.elder@ideasonboard.com>
 <20200710152858.486326-2-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710152858.486326-2-paul.elder@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Sat, Jul 11, 2020 at 12:28:54AM +0900, Paul Elder wrote:
> Add a --version option to v4l2-ctl to retrieve the version of v4l2-ctl.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 1 +
>  utils/v4l2-ctl/v4l2-ctl.cpp        | 9 +++++++++
>  utils/v4l2-ctl/v4l2-ctl.h          | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 47f5da1a..9b785cbf 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -121,6 +121,7 @@ void common_usage()
>  	       "  --silent           only set the result code, do not print any messages\n"
>  	       "  --sleep <secs>     sleep <secs>, call QUERYCAP and close the file handle\n"
>  	       "  --verbose          turn on verbose ioctl status reporting\n"
> +	       "  --version          show version information\n"
>  	       );
>  }
>  
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index 4972591e..bc7330c4 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -284,6 +284,7 @@ static struct option long_options[] = {
>  	{"stream-out-user", optional_argument, 0, OptStreamOutUser},
>  	{"stream-out-dmabuf", no_argument, 0, OptStreamOutDmaBuf},
>  	{"list-patterns", no_argument, 0, OptListPatterns},
> +	{"version", no_argument, 0, OptVersion},
>  	{0, 0, 0, 0}
>  };
>  
> @@ -306,6 +307,11 @@ static void usage_all()
>         edid_usage();
>  }
>  
> +static void version()
> +{
> +	printf("v4l2-ctl " PACKAGE_VERSION "\n");

I'd write

	printf("v4l2-ctl %s\n", PACKAGE_VERSION);

in case PACKAGE_VERSION would get a % in the future.

Same for the other patches in this series.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  int test_ioctl(int fd, unsigned long cmd, void *arg)
>  {
>  	return options[OptUseWrapper] ? v4l2_ioctl(fd, cmd, arg) : ioctl(fd, cmd, arg);
> @@ -1245,6 +1251,9 @@ int main(int argc, char **argv)
>  		case OptSleep:
>  			secs = strtoul(optarg, 0L, 0);
>  			break;
> +		case OptVersion:
> +			version();
> +			return 0;
>  		case ':':
>  			fprintf(stderr, "Option '%s' requires a value\n",
>  					argv[optind]);
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index 28e50471..27a3ca35 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -263,6 +263,7 @@ enum Option {
>  	OptHelpStreaming,
>  	OptHelpEdid,
>  	OptHelpAll,
> +	OptVersion,
>  	OptLast = 512
>  };
>  

-- 
Regards,

Laurent Pinchart

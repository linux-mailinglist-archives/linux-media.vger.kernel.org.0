Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB6A21B645
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 15:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgGJNZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 09:25:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgGJNZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 09:25:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5998BC08C5CE
        for <linux-media@vger.kernel.org>; Fri, 10 Jul 2020 06:25:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 810382C0;
        Fri, 10 Jul 2020 15:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594387542;
        bh=49ZaW1a5B2Y+qMmvawS6y4s/fMQB690wUCISdP9teUI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QzxeUBxSv8Hivt3OO/1tEVyXrCmpjCfpxtwu0v+pCEgfd4UGfK1wWkspN7zPz5P8E
         vnx2H5F/E73qA+8HZiIqZU/dmpUWWmPAtA7vbQHBibs/O5oZPqtTGooyi4Q4uDMBDw
         KA15HF08INy5GvMb2hEgVE3JHBCD/dwAjs9iyi0s=
Date:   Fri, 10 Jul 2020 16:25:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/2] v4l2-compliance: Add version command
Message-ID: <20200710132536.GX5964@pendragon.ideasonboard.com>
References: <20200710131813.452513-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710131813.452513-1-paul.elder@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Fri, Jul 10, 2020 at 10:18:12PM +0900, Paul Elder wrote:
> Add a --version option to v4l2-compliance to retrieve the version of
> v4l2-compliance.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 4b45f110..72b9768f 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -79,6 +79,7 @@ enum Option {
>  	OptMediaBusInfo = 'z',
>  	OptStreamFrom = 128,
>  	OptStreamFromHdr,
> +	OptVersion,
>  	OptLast = 256
>  };
>  
> @@ -153,9 +154,15 @@ static struct option long_options[] = {
>  	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
>  	{"stream-all-io", no_argument, 0, OptStreamAllIO},
>  	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
> +	{"version", no_argument, 0, OptVersion},
>  	{0, 0, 0, 0}
>  };
>  
> +static void version()
> +{
> +	printf("v4l2-compliance " PACKAGE_VERSION "\n");

Is it enough to rely on the v4l-utils package version, or should we add
a git commit count as well ? The traditional version number will make it
difficult to test for features added between two released versions.

> +}
> +
>  static void usage()
>  {
>  	printf("Usage:\n");
> @@ -244,6 +251,7 @@ static void usage()
>  	printf("  -P, --no-progress  Turn off progress messages.\n");
>  	printf("  -T, --trace        Trace all called ioctls.\n");
>  	printf("  -v, --verbose      Turn on verbose reporting.\n");
> +	printf("  --version          Show version information.\n");
>  #ifndef NO_LIBV4L2
>  	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
>  #endif
> @@ -1664,6 +1672,9 @@ int main(int argc, char **argv)
>  		case OptNoProgress:
>  			no_progress = true;
>  			break;
> +		case OptVersion:
> +			version();
> +			std::exit(EXIT_SUCCESS);
>  		case ':':
>  			fprintf(stderr, "Option `%s' requires a value\n",
>  				argv[optind]);

-- 
Regards,

Laurent Pinchart

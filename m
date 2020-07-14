Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9076221EAAB
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 09:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgGNHyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 03:54:51 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44641 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725793AbgGNHyv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 03:54:51 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id vFm1jBLLXGLmCvFm4jCth6; Tue, 14 Jul 2020 09:54:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594713288; bh=Sb0ge8b6+I405wB0ZN79asYTCbSSK65lnDLrbs8sHxc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=VqwlV9P321+AYnHvv6Ry8tuPSXCE+lh6F23EHbfbx8mLUk4iV9HVBCPak+UUv0d8A
         4TEsE3Plq+YZ5fF7zVUBY1FM7+tOo9YcodZnLZjny/bgnRQidQZ+5nA2b8iMZdizQ+
         KnbuankJFe55nh/lVJmhVIBUmKmoIloZz25fApJzBOCAuhyRnMaLEwEn5CGKPoq7js
         H/0Y8yADU5+8GZ6wG4SYJdO+ycKghRDs97yVA2K4mI8ekNOLLj+AfoF0qSbw/dpQV9
         kdpIHm6sQ/p2ipVOi87OnjOjujgwL3jecC0/+AAGXQMzkMZGK7TegMD7SLCC/iZ57U
         rDPYBDrWkaegg==
Subject: Re: [PATCH v4 2/7] v4l2-compliance: Add version command
To:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20200714055915.640438-1-paul.elder@ideasonboard.com>
 <20200714055915.640438-2-paul.elder@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e6924a3d-8255-2093-c0c2-f273e9c73cec@xs4all.nl>
Date:   Tue, 14 Jul 2020 09:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714055915.640438-2-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLavjsCBmbGOnYTOQLASJco+h6cfwRHO5d9bVRrJ3BrvYMHJRXyYEMn5cXkq716O9AQt/BPS2jCt+RaVHE5Ig+tcLHmEhPtT+MdpY+6/twr3ZIrAXE/6
 RqNybzRGDjIxHFAr6usDwNghDvjqm3DtS7xS0xNxr77YOk2DPIR+DFc8DMuyiPzxmR6nrHp/DdbAoPypaOerU+1bqgALcdKzleRdUXAhFNGKBdaBjcxOn6zi
 32mGjAdnhP8U+TMiGcBSv4Ef9cUeu3CxeHtlEWGYlFM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/07/2020 07:59, Paul Elder wrote:
> Add a --version option to v4l2-compliance to retrieve the version of
> v4l2-compliance. While at it, factor out and reorder printing the SHA to
> after argument parsing.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> Changes in v4:
> - add git commit count to version
> 
> Changes in v3:
> - embed PACKAGE_VERSION instead of string concatenation
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp | 30 ++++++++++++++++++-----

Ah, I almost forgot: the man pages also need to be updated with the new option.
Sorry for mentioning this so late, if it is any consolation, I also regularly
forget to update a man page :-) Note that media-ctl doesn't have a man page,
so I'll take the first and last patch and skip the others.

>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 825f2aa6..97c79e40 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -76,6 +76,7 @@ enum Option {
>  	OptMediaBusInfo = 'z',
>  	OptStreamFrom = 128,
>  	OptStreamFromHdr,
> +	OptVersion,
>  	OptLast = 256
>  };
>  
> @@ -150,9 +151,24 @@ static struct option long_options[] = {
>  	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
>  	{"stream-all-io", no_argument, 0, OptStreamAllIO},
>  	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
> +	{"version", no_argument, 0, OptVersion},
>  	{0, 0, 0, 0}
>  };
>  
> +static void print_sha()
> +{
> +#define STR(x) #x
> +#define STRING(x) STR(x)

Since that means that there will be a v5, I would prefer that the #defines come before
the function since STRING is used in two functions, not just print_sha(), which the
current placement suggests.

Ditto for cec-compliance.

Regards,

	Hans

> +	printf("v4l2-compliance SHA: %s", STRING(GIT_SHA));
> +	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
> +	printf("\n");
> +}
> +
> +static void print_version()
> +{
> +	printf("v4l2-compliance %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
> +}
> +
>  static void usage()
>  {
>  	printf("Usage:\n");
> @@ -241,6 +257,7 @@ static void usage()
>  	printf("  -P, --no-progress  Turn off progress messages.\n");
>  	printf("  -T, --trace        Trace all called ioctls.\n");
>  	printf("  -v, --verbose      Turn on verbose reporting.\n");
> +	printf("  --version          Show version information.\n");
>  #ifndef NO_LIBV4L2
>  	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
>  #endif
> @@ -1482,12 +1499,6 @@ int main(int argc, char **argv)
>  	char *value, *subs;
>  	int idx = 0;
>  
> -#define STR(x) #x
> -#define STRING(x) STR(x)
> -	printf("v4l2-compliance SHA: %s", STRING(GIT_SHA));
> -	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
> -	printf("\n");
> -
>  	if (!env_media_apps_color || !strcmp(env_media_apps_color, "auto"))
>  		show_colors = isatty(STDOUT_FILENO);
>  	else if (!strcmp(env_media_apps_color, "always"))
> @@ -1656,6 +1667,10 @@ int main(int argc, char **argv)
>  		case OptNoProgress:
>  			no_progress = true;
>  			break;
> +		case OptVersion:
> +			print_version();
> +			print_sha();
> +			std::exit(EXIT_SUCCESS);
>  		case ':':
>  			fprintf(stderr, "Option `%s' requires a value\n",
>  				argv[optind]);
> @@ -1677,6 +1692,9 @@ int main(int argc, char **argv)
>  		usage();
>  		std::exit(EXIT_FAILURE);
>  	}
> +
> +	print_sha();
> +
>  	bool direct = !options[OptUseWrapper];
>  	int fd;
>  
> 


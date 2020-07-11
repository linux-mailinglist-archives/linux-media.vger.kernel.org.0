Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAD8F21C360
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2020 11:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgGKJk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Jul 2020 05:40:58 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:53431 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727888AbgGKJk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Jul 2020 05:40:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id uC04jqXK8JcNHuC07jt2xr; Sat, 11 Jul 2020 11:40:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594460456; bh=4+n5mpgEMOu7TXQOKUVECMNVSeyyRnUGocCbZKFGLB4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XcxNTNOUKvlCtjtX/t2Nzsne0eHVKezoEj7wBMJJmFV3uOsyixZjVJ2aPZI1BQn76
         NE7v9ERwNcL332O7nCkVKabTkKzEKhdXwjlgruX2UhiV1V7aI+GcJ+pAknl1R6gi1m
         d6sQ5MtRCu5vKjbqP/RQUsVUeObAMsw2dm2OovEZjub69tha8LDoSCWPi3gzhVKsXQ
         oAvC6vcT1ohvzMHWVUiLMYF13E0eJ9YEddYThGn8lHGHy9R6SKRfx1GuBUxNG8+kUU
         NlacUizC8byEIMj4yWNMBsZ2ehZa0xpOeMbbWCh1vguYrjP8mxAflNfxcGb/jT5DAR
         T55W2ZWcAE2eA==
Subject: Re: [PATCH v3 1/6] v4l2-compliance: Add version command
To:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20200711052414.492535-1-paul.elder@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <dda14e18-c01e-6d33-d896-624e57d395de@xs4all.nl>
Date:   Sat, 11 Jul 2020 11:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711052414.492535-1-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI1afY2NKetMc15rOREQsuANi/OLlNDXFZOahauQ1sPLdB5GBoxj/rszr5yciipXXb1icUxaT8iV48TSEYOCMaksm/6Y+y6YQ3Hloekl75qLYgi3fSkf
 /9gEGiuj8UWlOie/ahm+mKfdSDrYCoE9SbDxEaFplJhR4WW291PsS41vFeJ/4Dyo7G34NqU/3pCdoLUXwTeCfLWMPy+es3G01ZbMt7Byr9wJY8fmYGKIqgwn
 kFC9MerUdGcak1fRaBN2K2ioC0IklJqTzZrT0FsBZ1A=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/07/2020 07:24, Paul Elder wrote:
> Add a --version option to v4l2-compliance to retrieve the version of
> v4l2-compliance. While at it, factor out and reorder printing the SHA to
> after argument parsing.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> Changes in v3:
> - embed PACKAGE_VERSION instead of string concatenation
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp | 40 ++++++++++++++++-------
>  1 file changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index df46e86f..38d77d07 100644
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
> @@ -153,9 +154,29 @@ static struct option long_options[] = {
>  	{"stream-all-formats", optional_argument, 0, OptStreamAllFormats},
>  	{"stream-all-io", no_argument, 0, OptStreamAllIO},
>  	{"stream-all-color", required_argument, 0, OptStreamAllColorTest},
> +	{"version", no_argument, 0, OptVersion},
>  	{0, 0, 0, 0}
>  };
>  
> +static void print_sha()
> +{
> +#ifdef SHA
> +#define STR(x) #x
> +#define STRING(x) STR(x)
> +	printf("v4l2-compliance SHA: %s", STRING(SHA));
> +#else
> +	printf("v4l2-compliance SHA: not available");
> +#endif
> +
> +	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
> +	printf("\n");
> +}
> +
> +static void version()

I'd rename this to print_version to correspond with print_sha.

> +{
> +	printf("v4l2-compliance %s\n", PACKAGE_VERSION);

Didn't we want to include the commit count in this as per the discussion with Laurent?

BTW, I've updated the v4l2/cec-compliance utils to obtain the SHA in simplified way
without having to create a version.h.

configure.ac now defines a GIT_SHA variable that makefiles can use to pass to the
compiler.

To do the same for the commit count you would add this to configure.ac:

# Obtain git commit count of HEAD
AC_SUBST(GIT_COMMIT_CNT, ["-DGIT_COMMIT_CNT=\$(shell if test -d \$(top_srcdir)/.git ; then printf '-'; git -C \$(top_srcdir) rev-list
--count HEAD ; fi)"])

In the Makefile.am you'd add $(GIT_COMMIT_CNT) to CPPFLAGS and the version function
would read like this:

static void print_version()
{
	printf("v4l2-compliance %s%s\n", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
}

Regards,

	Hans

> +}
> +
>  static void usage()
>  {
>  	printf("Usage:\n");
> @@ -244,6 +265,7 @@ static void usage()
>  	printf("  -P, --no-progress  Turn off progress messages.\n");
>  	printf("  -T, --trace        Trace all called ioctls.\n");
>  	printf("  -v, --verbose      Turn on verbose reporting.\n");
> +	printf("  --version          Show version information.\n");
>  #ifndef NO_LIBV4L2
>  	printf("  -w, --wrapper      Use the libv4l2 wrapper library.\n");
>  #endif
> @@ -1485,17 +1507,6 @@ int main(int argc, char **argv)
>  	char *value, *subs;
>  	int idx = 0;
>  
> -#ifdef SHA
> -#define STR(x) #x
> -#define STRING(x) STR(x)
> -	printf("v4l2-compliance SHA: %s", STRING(SHA));
> -#else
> -	printf("v4l2-compliance SHA: not available");
> -#endif
> -
> -	printf(", %zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
> -	printf("\n");
> -
>  	if (!env_media_apps_color || !strcmp(env_media_apps_color, "auto"))
>  		show_colors = isatty(STDOUT_FILENO);
>  	else if (!strcmp(env_media_apps_color, "always"))
> @@ -1664,6 +1675,10 @@ int main(int argc, char **argv)
>  		case OptNoProgress:
>  			no_progress = true;
>  			break;
> +		case OptVersion:
> +			version();
> +			print_sha();
> +			std::exit(EXIT_SUCCESS);
>  		case ':':
>  			fprintf(stderr, "Option `%s' requires a value\n",
>  				argv[optind]);
> @@ -1685,6 +1700,9 @@ int main(int argc, char **argv)
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


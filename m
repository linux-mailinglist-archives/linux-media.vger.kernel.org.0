Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FFD1B5745
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgDWIek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:34:40 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47069 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbgDWIek (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:34:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RXJajKx5m7xncRXJdjPlpJ; Thu, 23 Apr 2020 10:34:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587630877; bh=n+2uIFGTENxD9Z1DpJ5oNmoneX8hD/bM8Y79bi9M83c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TD3kL1c+AMDTsIvxLAAB/G47EOiBZKFWyTunb3sDeY40wrpD4JmUte3fDtLys6cX0
         rw9rK2VTRIDRtPFPvC2wQUTunfGYlvZ39O32uoZBNk8Vx9ywTdfpx0gea+cZdJRyH/
         YvEnZXOcCbBhJ583zh/3/Qmhz4H9NxnXwjTXcykHc+pa9jPcdmV7CBpxM5FkzwGbNg
         zGapzNSgqfGpTach7nr2VOpG4s+zYyeu5XAFe6sIS7aj5sLZZrF/wRyLIXHHByVoaz
         0zC7JtrAK1VmbLo/7KBFIRuuNHDJO4UzPSBs8YepYQwNCmh3B/dirJM8EMZRNyNpW5
         A0niFYEVZSSHQ==
Subject: Re: [PATCH 06/12] utils: add noreturn attribute and remove dead code
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200422003735.3891-1-rosenp@gmail.com>
 <20200422003735.3891-6-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <a7c14a7b-a5fb-b1d9-540e-30c72d5a702d@xs4all.nl>
Date:   Thu, 23 Apr 2020 10:34:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422003735.3891-6-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLuQNd8bAvjCe97Yu6dy8crl2BxGzpa9q3eLHNCHgsWAcDCte1O1V6aRzu2ylXZKJnL8H3e2/OEe3pex3UnQxCQ3lfEILz/k6grAZ2v+Qd4is982KI/4
 KRKvAIwRoyqELAxvhfZgVr2VXFta8t049Jj6qeke4p5T+OySJvu9aWLIjz5586RUku1ydXStRNzTlOiyZd6zJLi4Rxy+8uxxs/g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 02:37, Rosen Penev wrote:
> Found with -Wmissing-noreturn and -Wunreachable-code-return
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp | 9 ++-------
>  utils/v4l2-dbg/v4l2-dbg.cpp               | 7 +------
>  2 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index b3a18492..fbf34914 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -155,6 +155,7 @@ static struct option long_options[] = {
>  	{0, 0, 0, 0}
>  };
>  
> +__attribute__((noreturn))
>  static void usage()
>  {
>  	printf("Usage:\n");

I think usage() shouldn't exit, instead leave that to the caller.

> @@ -482,6 +483,7 @@ static void restoreState()
>  	node->reopen();
>  }
>  
> +__attribute__((noreturn))
>  static void signal_handler_interrupt(int signum)
>  {
>  	restoreState();
> @@ -1544,7 +1546,6 @@ int main(int argc, char **argv)
>  		switch (ch) {
>  		case OptHelp:
>  			usage();
> -			return 0;

So instead of doing 'return 0;', do 'exit(0);' here and exit(1) elsewhere.

Clearly in many cases I already assumed that usage() would return, so let's
change usage() accordingly.

Same for v4l2-dbg.cpp.

Regards,

	Hans

>  		case OptSetDevice:
>  			device = make_devname(optarg, "video", media_bus_info);
>  			break;
> @@ -1619,7 +1620,6 @@ int main(int argc, char **argv)
>  						color_component = 2;
>  					else {
>  						usage();
> -						exit(1);
>  					}
>  					break;
>  				case 1:
> @@ -1634,7 +1634,6 @@ int main(int argc, char **argv)
>  					break;
>  				default:
>  					usage();
> -					exit(1);
>  				}
>  			}
>  			break;
> @@ -1647,7 +1646,6 @@ int main(int argc, char **argv)
>  				show_colors = isatty(STDOUT_FILENO);
>  			else {
>  				usage();
> -				exit(1);
>  			}
>  			break;
>  		case OptNoWarnings:
> @@ -1669,13 +1667,11 @@ int main(int argc, char **argv)
>  			fprintf(stderr, "Option `%s' requires a value\n",
>  				argv[optind]);
>  			usage();
> -			return 1;
>  		case '?':
>  			if (argv[optind])
>  				fprintf(stderr, "Unknown argument `%s'\n",
>  					argv[optind]);
>  			usage();
> -			return 1;
>  		}
>  	}
>  	if (optind < argc) {
> @@ -1684,7 +1680,6 @@ int main(int argc, char **argv)
>  			fprintf(stderr, "%s ", argv[optind++]);
>  		fprintf(stderr, "\n");
>  		usage();
> -		return 1;
>  	}
>  	bool direct = !options[OptUseWrapper];
>  	int fd;
> diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> index cd387d1d..7b986a50 100644
> --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> @@ -162,6 +162,7 @@ static struct option long_options[] = {
>  	{0, 0, 0, 0}
>  };
>  
> +__attribute__((noreturn))
>  static void usage()
>  {
>  	printf("Usage: v4l2-dbg [options] [values]\n"
> @@ -387,13 +388,11 @@ static int parse_subopt(char **subs, const char * const *subopts, char **value)
>  	if (opt == -1) {
>  		fprintf(stderr, "Invalid suboptions specified\n");
>  		usage();
> -		exit(1);
>  	}
>  	if (*value == NULL) {
>  		fprintf(stderr, "No value given to suboption <%s>\n",
>  				subopts[opt]);
>  		usage();
> -		exit(1);
>  	}
>  	return opt;
>  }
> @@ -429,7 +428,6 @@ int main(int argc, char **argv)
>  
>  	if (argc == 1) {
>  		usage();
> -		return 0;
>  	}
>  	for (i = 0; long_options[i].name; i++) {
>  		if (!isalpha(long_options[i].val))
> @@ -467,7 +465,6 @@ int main(int argc, char **argv)
>  		switch (ch) {
>  		case OptHelp:
>  			usage();
> -			return 0;
>  
>  		case OptSetDevice:
>  			device = optarg;
> @@ -538,13 +535,11 @@ int main(int argc, char **argv)
>  			fprintf(stderr, "Option `%s' requires a value\n",
>  				argv[optind]);
>  			usage();
> -			return 1;
>  
>  		case '?':
>  			fprintf(stderr, "Unknown argument `%s'\n",
>  				argv[optind]);
>  			usage();
> -			return 1;
>  		}
>  	}
>  
> 


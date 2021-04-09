Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A596C35967D
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 09:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhDIHhC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 03:37:02 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43365 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229621AbhDIHhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 03:37:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Ulh6lYoysgIC3Ulh9lBNug; Fri, 09 Apr 2021 09:36:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617953808; bh=FZKnp+i6ej8wW7s6zhRNv75eOBlfohmpZyzny6z/wZs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r1MdFud83e9uP/mY+oNtSG8IU3pVYxydTc8ZwKmjnLVdC4zyjhvyQlkU8p5uQTNAC
         f4XcjEyMt7gVi0rWkO+umyH8ITqO4Uz0rggKUABSEeP880tDY8/7Lu+KG8qwLcJM2U
         8C3AfVoYQSjB9Ffm+v1rL/nUM+SBbCsHetmrwN6eE2cesaD83eIxDo6NdIFz6dXxXp
         +JipX0X1XLOxsQnmaMhO+W73+g9H/0JCrSLcmlqy93TWK86FYt/QTWhMNxDyuiiRrf
         jNYf/JTV2JQrKuRY5Q7Zmo751oFcH1/tAIS/bf9m04Za0h3jZFH2Lrv1djVRrRHoWO
         w6Ka4jYbpVjfQ==
Subject: Re: [PATCH] staging: media: zoran: add '*' in subsequent line
To:     Mitali Borkar <mitaliborkar810@gmail.com>, clabbe@baylibre.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
References: <YG+MKk9C/fTd7vj4@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2e57ea09-ce08-496a-09ec-4b8f72eface5@xs4all.nl>
Date:   Fri, 9 Apr 2021 09:36:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YG+MKk9C/fTd7vj4@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCpCFGd6+94vAGTwesF9ortrOUnAW+aeGlfnIndyxlRwSGGBo3B1xTGI4V3r5nmXnPxxJ5qQpMpbqSvTryr54T4pU1gFRzAsXJ++CTN3ZvyY041Scmtr
 yybtl6ABkV0Q/dqVeh+Q15nHUETxRAxDnYHXguh0pFuBxtqtXT4KEqSqWudtXXrJxc5Syu31xiLIXaishfJxtB1OguCTy+1EImWTu7chvz7RcjJnB4X9jFOG
 OEieqA+MdbPR1lDSuCsWL8nYnRTmwP4g9Qs/QvQhXvLMTt/ptGJCuOvL0CXLIggrycnWLN2GiXBYakHdiM3fzpFAJLzpFDpAL9jrKHIlj79wfPElwY6ocvvi
 OALG3rk2WuAlL0UfqrBtcLTnPZazrbEmPoFEY4wVXPDeBgy1O4UaMslgN3gBSBuHQWLomqdNXJubcyt5oDS9XtUD18PIyw8E9YiVbEY5AmxSy/i7ydZm0IG9
 BFxfUuUul1lB/aYgiKgxE9EBpwBYlVD7c6zflQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mitali,

On 09/04/2021 01:05, Mitali Borkar wrote:
> Added '*' in susbsequent lines for block comments to meet linux kernel
> coding style.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/zoran/zr36050.c | 34 +++++++++++++--------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
> index 2826f4e5d37b..663ac2b3434e 100644
> --- a/drivers/staging/media/zoran/zr36050.c
> +++ b/drivers/staging/media/zoran/zr36050.c
> @@ -25,7 +25,7 @@
>  #include "videocodec.h"
>  
>  /* it doesn't make sense to have more than 20 or so,
> -  just to prevent some unwanted loops */
> + * just to prevent some unwanted loops */

Use proper coding style for long comments:

/*
 * text
 * text
 */

checkpatch.pl warns about that, so did you run checkpatch.pl after your modifications
were made? After fixing checkpatch issues, always run it again to make sure the issue
is really fixed and not just replaced by another issue.

Regards,

	Hans

>  #define MAX_CODECS 20
>  
>  /* amount of chips attached via this driver */
> @@ -43,7 +43,7 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
>  	} while (0)
>  
>  /* =========================================================================
> -   Local hardware I/O functions:
> + *  Local hardware I/O functions:
>  
>     read/write via codec layer (registers are located in the master device)
>     ========================================================================= */
> @@ -80,7 +80,7 @@ static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> + *  Local helper function:
>  
>     status read
>     ========================================================================= */
> @@ -95,7 +95,7 @@ static u8 zr36050_read_status1(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> + *  Local helper function:
>  
>     scale factor read
>     ========================================================================= */
> @@ -112,7 +112,7 @@ static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> + *  Local helper function:
>  
>     wait if codec is ready to proceed (end of processing) or time is over
>     ========================================================================= */
> @@ -133,7 +133,7 @@ static void zr36050_wait_end(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> + *  Local helper function:
>  
>     basic test of "connectivity", writes/reads to/from memory the SOF marker
>     ========================================================================= */
> @@ -174,7 +174,7 @@ static int zr36050_basic_test(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Local helper function:
> + *  Local helper function:
>  
>     simple loop for pushing the init datasets
>     ========================================================================= */
> @@ -192,7 +192,7 @@ static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char
>  }
>  
>  /* =========================================================================
> -   Basic datasets:
> + *  Basic datasets:
>  
>     jpeg baseline setup data (you find it on lots places in internet, or just
>     extract it from any regular .jpg image...)
> @@ -294,7 +294,7 @@ static const char zr36050_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
>  static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>  
>  /* =========================================================================
> -   Local helper functions:
> + *  Local helper functions:
>  
>     calculation and setup of parameter-dependent JPEG baseline segments
>     (needed for compression only)
> @@ -303,7 +303,7 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
>  /* ------------------------------------------------------------------------- */
>  
>  /* SOF (start of frame) segment depends on width, height and sampling ratio
> -			 of each color component */
> + *			 of each color component */
>  
>  static int zr36050_set_sof(struct zr36050 *ptr)
>  {
> @@ -334,7 +334,7 @@ static int zr36050_set_sof(struct zr36050 *ptr)
>  /* ------------------------------------------------------------------------- */
>  
>  /* SOS (start of scan) segment depends on the used scan components
> -			of each color component */
> + *			of each color component */
>  
>  static int zr36050_set_sos(struct zr36050 *ptr)
>  {
> @@ -378,7 +378,7 @@ static int zr36050_set_dri(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   Setup function:
> + *  Setup function:
>  
>     Setup compression/decompression of Zoran's JPEG processor
>     ( see also zoran 36050 manual )
> @@ -531,13 +531,13 @@ static void zr36050_init(struct zr36050 *ptr)
>  }
>  
>  /* =========================================================================
> -   CODEC API FUNCTIONS
> + *  CODEC API FUNCTIONS
>  
>     this functions are accessed by the master via the API structure
>     ========================================================================= */
>  
>  /* set compression/expansion mode and launches codec -
> -   this should be the last call from the master before starting processing */
> + *  this should be the last call from the master before starting processing */
>  static int zr36050_set_mode(struct videocodec *codec, int mode)
>  {
>  	struct zr36050 *ptr = (struct zr36050 *)codec->data;
> @@ -707,7 +707,7 @@ static int zr36050_control(struct videocodec *codec, int type, int size, void *d
>  }
>  
>  /* =========================================================================
> -   Exit and unregister function:
> + *  Exit and unregister function:
>  
>     Deinitializes Zoran's JPEG processor
>     ========================================================================= */
> @@ -732,7 +732,7 @@ static int zr36050_unset(struct videocodec *codec)
>  }
>  
>  /* =========================================================================
> -   Setup and registry function:
> + *  Setup and registry function:
>  
>     Initializes Zoran's JPEG processor
>  
> @@ -813,7 +813,7 @@ static const struct videocodec zr36050_codec = {
>  };
>  
>  /* =========================================================================
> -   HOOK IN DRIVER AS KERNEL MODULE
> + *  HOOK IN DRIVER AS KERNEL MODULE
>     ========================================================================= */
>  
>  static int __init zr36050_init_module(void)
> 


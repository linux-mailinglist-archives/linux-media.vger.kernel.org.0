Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A09119E7CB
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 23:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgDDVpE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 17:45:04 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38970 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgDDVpE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 17:45:04 -0400
Received: by mail-pl1-f193.google.com with SMTP id k18so4303936pll.6
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 14:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=euinAWs1EYoKHCFTqSkSRkq1UMBFC+DCJVlO7q/ffy4=;
        b=f8h9YNfvZmRasPIXwjY+My5GtAF9fzHkaM0I8trvNjzNvtS2+1dVZfbk77BGgZeGYs
         yyW3A1CSsrqqZO4jGzfZzuSf1nBs8RA/4GODqGEQb5j9SJvdJJHRKC02pTTds+siyM08
         vjuLIlmfGI/ZHYFU1iDOlWfDIQMTtzaElhu0lnNZ1rmcFMmWwBlpFS2O8vhLUfu3Nz1F
         2GzlrUn91LcPon5hMPNafyR2LPF2p3o7/+urPdU1yFhfMCC3M1orU6OyrmR1ghortczL
         1xgWGlg1duQ/n4iK1DD7GZP4QuKFoM8zoeh56Fycy45gq0hcEFcGiyvMnxwd8gcpoQs2
         ep1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=euinAWs1EYoKHCFTqSkSRkq1UMBFC+DCJVlO7q/ffy4=;
        b=DLL1NdYnnLuVZze2HIX5ePHEtEssKYZKRl+yjoWy4OrEJTGiKL4jXl22+1QlrP9PiV
         ml9NlHGR2wjUfdSjreOsNXZVsT2/4g7W2wjkSdyWv/6StX1odRyXuV+ft7s/ZktMD9p6
         pEGb7P6xG1e1TKyhF1wLfIF0OgeDsxxgrRw1d7St6mComdSat7lDwo2PW55cja/rmZ2s
         ie1eH+vIKLzdsw4CFYIBObgJG94NuqFjDU2TTZAhVnm3Ef2CPg9AQvAQIk05P93jA0MH
         sdBlrF64edQoutduxCGKqT92YIKWfYgUI/vJ9Gn7lXx2WTJ76y2vlQswyP197dGFBeJp
         xAMw==
X-Gm-Message-State: AGi0PubsxvJzonaZvfj7Yn3SrrmOXj9NcEKv6Ij9XfKxMf4JYPqi0XWQ
        HHb1mFjGXy10m6Cp8/UA79Rlte3RP7s=
X-Google-Smtp-Source: APiQypI57/l6V3VxaEsopGHY/U7XQZBnF2kTWBSgCJ3Imwq10QVmbPEhHYvCEmNqnMnjr4+TI51ioQ==
X-Received: by 2002:a17:90a:216d:: with SMTP id a100mr16889578pje.177.1586036702636;
        Sat, 04 Apr 2020 14:45:02 -0700 (PDT)
Received: from [192.168.1.103] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id x186sm8293784pfb.151.2020.04.04.14.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2020 14:45:01 -0700 (PDT)
Subject: Re: [PATCH v5 00/12] media: imx: Miscellaneous format-related
 cleanups
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <2076614b-ece4-edd6-85fd-582d308685fd@gmail.com>
Date:   Sat, 4 Apr 2020 14:45:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

I need to send a v6. I really don't like that the positioning of the 
last patch (" Split find|enum_format into fourcc and mbus functions"). 
This patch needs to be moved up in the series, which will make the 
patches easier to read and reduce the patch count by 1. The end result 
will be identical.

Steve


On 4/3/20 1:58 PM, Steve Longerbeam wrote:
> This series picks up Laurent Pinchart's series:
>
> [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
>
> with a merge of two patches from Philipp Zabel's series:
>
> [PATCH 1/3] media: imx: enable V4L2_PIX_FMT_XBGR32, _BGRX32, and _RGBX32
>
> with an additional patch at the end that splits up the find_enum_format()
> functions into separate functions for in-memory fourcc codes and mbus
> codes, as requested by Hans Verkuil in the series from Philipp.
>
> History:
>
> v5:
> - Added a patch that renames the pixel format selection enums/flags.
> - Added a patch that adds another format selection flag, to select
>    the IPU-internal formats. This is an alternative to the previous
>    patch "media: imx: utils: Simplify IPU format lookup and enumeration".
> - Add comments for the struct imx_media_pixfmt members, with a
>    warning that the codes pointer is NULL for the in-memory-only formats.
>
> v4:
> - Constify mbus arg to imx_media_mbus_fmt_to_ipu_image().
> - Constify ipu_image arg to imx_media_ipu_image_to_mbus_fmt().
> - Return -EINVAL in imx_media_ipu_image_to_mbus_fmt() if given
>    image pixelformat does not have mbus codes.
>
> v3:
> - fixed derefencing a NULL cc->codes on return from imx_media_find_format()
>    in several places.
>
> v2:
> - fixed a bug:
>    "for (j=0; j < fmt->codes[j]; j++)" should be
>    "for (j=0; fmt->codes[j]; j++)", in the mbus format enum functions.
>    Caught by Laurent.
> - move some local vars under the pixel_formats[] loop. Suggested by Laurent.
> - decrement the index passed to the enum functions, instead of introducing
>    a match_index local var. Suggested by Laurent.
>
>
> Laurent Pinchart (6):
>    media: imx: utils: Inline init_mbus_colorimetry() in its caller
>    media: imx: utils: Handle Bayer format lookup through a selection flag
>    media: imx: utils: Make imx_media_pixfmt handle variable number of
>      codes
>    media: imx: utils: Remove unneeded argument to (find|enum)_format()
>    media: imx: utils: Rename format lookup and enumeration functions
>    media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*
>
> Philipp Zabel (2):
>    media: imx: utils: fix and simplify pixel format enumeration
>    media: imx: utils: fix media bus format enumeration
>
> Steve Longerbeam (4):
>    media: imx: utils: Rename pixel format selection enumeration
>    media: imx: utils: Introduce PIXFMT_SEL_IPU
>    media: imx: utils: Constify ipu_image argument to
>      imx_media_ipu_image_to_mbus_fmt()
>    media: imx: utils: Split find|enum_format into fourcc and mbus
>      functions
>
>   drivers/staging/media/imx/imx-ic-prp.c        |  13 +-
>   drivers/staging/media/imx/imx-ic-prpencvf.c   |  13 +-
>   drivers/staging/media/imx/imx-media-capture.c |  42 +-
>   .../staging/media/imx/imx-media-csc-scaler.c  |   3 +-
>   drivers/staging/media/imx/imx-media-csi.c     |  42 +-
>   drivers/staging/media/imx/imx-media-utils.c   | 526 ++++++++----------
>   drivers/staging/media/imx/imx-media-vdic.c    |  12 +-
>   drivers/staging/media/imx/imx-media.h         |  45 +-
>   drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
>   9 files changed, 327 insertions(+), 384 deletions(-)
>


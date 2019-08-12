Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 782458A007
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 15:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfHLNti (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 09:49:38 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36186 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbfHLNti (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 09:49:38 -0400
Received: by mail-lj1-f193.google.com with SMTP id u15so3378416ljl.3
        for <linux-media@vger.kernel.org>; Mon, 12 Aug 2019 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ROPO1sZKfqKLfKVNvQuyQt9z9drCu0c9WVxEqexQkzg=;
        b=jqXydVo2FcsqYyNmgAvf/l5H3GS8vhS6Gi7fmoz4QvSrpG5voKzC2/idqavIxrxmsO
         1L6PbsvVtMfs3s2DWh3Ltfxsp5Hvj4oxGyQ/1a5Gko/BvJLGKwaBVGtcRsZxFhL82WQT
         HgWIS8naoF0LAr5PwET+Bn20zpcfokbHd4uRzJ+5sbssI8kyVzpq+KW6I4SyvFLXx67p
         dONCr3Je9Dnc9umA29kHC9GdaPrJMunxySCOojSNRBskocOTSuf+3acpKykOCtzCbDat
         VBOzsPaqz8MqMq/yZWxFlR+kEYm4mZ/rs7+T0zAQij1E2fmcHNUjI7TrGeMU/5Hsr/YE
         dUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ROPO1sZKfqKLfKVNvQuyQt9z9drCu0c9WVxEqexQkzg=;
        b=aPN4xeRLbE309yT2WblrLlUYqk3GDe/RakGdki+k+N8EUqfzB4Z95FU/Mn76v5pUY2
         crSwxRAXZ6yfuY4SIBO7twBy+Dc5GFcbru50lIZp9OIwNjGDG2G07xoRTDIYDHM7jkjS
         4ZqH9mx/97Ov9osNekNY3xZ65kZhuBjcAjsHHyjseuAzWn9vSQoFciIUuWejVroik9Jn
         OPCLa/P+f5O2WmoHU+VSI7c5HzZJ53C0mYjTL1dxL+ntIHkrHnv+F0quIPpYjDjl/MBD
         YDur9emJ93TBaWS/x0trwXIj7TstQjzJcN7rylM8/uVgp8gZdSYCQ6giger8RXNOlPT+
         ErvA==
X-Gm-Message-State: APjAAAXIMYr29ddirZRK4+oNVRVab4JU6LRLsP+6ah5de01iizHAG4ZO
        NXTvidFumUDyJwvUTB/LwcpTDw==
X-Google-Smtp-Source: APXvYqzFQINcV57K9epn93gpipAywxz9K2e8FLeNeycX19z+gbETXxmh+xfnWpVCtiqh0OrFSkCzoA==
X-Received: by 2002:a2e:55db:: with SMTP id g88mr10304687lje.27.1565617776014;
        Mon, 12 Aug 2019 06:49:36 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id l15sm1953492ljb.92.2019.08.12.06.49.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 06:49:35 -0700 (PDT)
Subject: Re: [PATCHv2 03/12] media: venus: vdec: flag OUTPUT formats with
 V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl>
 <20190812110513.23774-4-hverkuil-cisco@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <98b35b43-b402-536c-d883-e6b5fbb38572@linaro.org>
Date:   Mon, 12 Aug 2019 16:49:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812110513.23774-4-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the patch!

On 8/12/19 2:05 PM, Hans Verkuil wrote:
> From: Maxime Jourdan <mjourdan@baylibre.com>
> 
> Tag all the coded formats where the venus vdec supports dynamic
> resolution switching.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/platform/qcom/venus/core.h |  1 +
>  drivers/media/platform/qcom/venus/vdec.c | 11 +++++++++++
>  2 files changed, 12 insertions(+)

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

-- 
regards,
Stan

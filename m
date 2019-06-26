Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BE595737B
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 23:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfFZVTc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 17:19:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35133 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbfFZVTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 17:19:32 -0400
Received: by mail-wr1-f65.google.com with SMTP id f15so4397227wrp.2
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mkr1uoQrHTZEb21Y61JNdlYR6sylGUfd9gw/d+S7TJ0=;
        b=LJxS2Wx5PDsv4HD9NWPxktPZqZ33JCsk3GWvv2BSvkqTkXc+BWUiIQTayd+dnE2yAZ
         aG9XR+4VipNvN15AuJOHI/UcRR67I5IZgYUzrWMDW/koDYs1Io8fIJsiZ3adkXkidQWa
         zny4+OUC2y1I6twf7n+T+oF3qaxRrGeT+YzD+xwcxYdV2LZktrjo049qm2WMDUtP2fgB
         9iRtYaUCJjXVjFvHt8thdJOI74hPnnrIKFcZTmyFX7OtYl/HbUD6VgCC3BxwlXdrwhtX
         qdhQKnQcPqoZLyZihk1VDDNH+RWB5HwOuaOsqAyIXkmQKoPYAqZ5Q756RUQLF3Cz2b06
         eEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mkr1uoQrHTZEb21Y61JNdlYR6sylGUfd9gw/d+S7TJ0=;
        b=CNB2xlWBjyDMRjWm80QExQC5cqTEWMEVXC3coJ4tUVYuOytXkfVwMmTw5Smo2X6h0Y
         d5+TO7eRqz5erpZDjgf76Tzi4i6snCXSUk9KAZqxTgttmXKfB5qRVoyKbmnqCFYVIS0D
         DxZdcO/rOQR/SoChP1+NWtJpAkgSQiSEqdONA5KdUlMOcfzvaUo7Y2GUuICQ9mnJEzoa
         uZ5FThuHtyrR1I6u/Pj60r/VRS7zokxpVNDyvF8+YhtmleF0zzqsbYjKJCbKGlXywaHV
         TapUtSr2XP2OPOFBHizuP0TgJV0aARTWjDo8aiYfzDbeqH29utWjTCkhtrMfhvUgf9Ll
         KDTQ==
X-Gm-Message-State: APjAAAVii5Uw+Z7MlHlZCdlwKPUpxgC1vuRo6BxMHvR/VjPry8Cp+NYe
        TXEuL7KKlyFaSJ1oRk8u1+0=
X-Google-Smtp-Source: APXvYqzRSxaoJfxceQ0Sjvy8EDT1iop/1p+IenmEiYCHO8Ujpj5YPQnM0hZp22kL2TRuQyT2jhC49w==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr4550897wrv.296.1561583970109;
        Wed, 26 Jun 2019 14:19:30 -0700 (PDT)
Received: from [172.30.90.108] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id o185sm2344223wmo.45.2019.06.26.14.19.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 14:19:29 -0700 (PDT)
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20190625203945.28081-1-ezequiel@collabora.com>
 <1561535121.4870.1.camel@pengutronix.de>
 <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
Date:   Wed, 26 Jun 2019 14:19:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAOMZO5Be-5Em0DR5nCBfzsW4mKMz6ThF+kSukcG6WuFF-0vwaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/26/19 12:53 PM, Fabio Estevam wrote:
> Hi Philipp,
>
> On Wed, Jun 26, 2019 at 4:45 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
>> I think the messages could use a note that they may be due to a sensor
>> or sensor driver bug, and that there might be image artifacts or
>> outright failure to capture as a consequence.
> Yes, this a good idea.
>
> With this patch I could successfully test camera capture on a
> imx6dl-wandboard connected to a OV5645.
>
> Without this patch the Gsteamer pipeline fails.

Did you only get the LP-11 timeout warning message with this patch on 
the OV5645, or both the LP-11 timeout and clock lane timeout warnings? 
As I said it's OK to relax the LP-11 timeout to be warning only, but 
clock lane timeout should remain an error, since without an active clock 
on the clock lane it's guaranteed that no data will be received from the 
sensor.

Steve

>
> Tested-by: Fabio Estevam <festevam@gmail.com>


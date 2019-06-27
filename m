Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEAB58DC3
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 00:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfF0WOn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 18:14:43 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51630 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF0WOm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 18:14:42 -0400
Received: by mail-wm1-f66.google.com with SMTP id 207so7158580wma.1
        for <linux-media@vger.kernel.org>; Thu, 27 Jun 2019 15:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Eef8D41PLjKSHdCiM7PwAp3fT3psPNoQPdTMNa31Hpc=;
        b=Axu4xV2lGMCGNPB+GIUukRRgk9D4bMDXvh1IITBoutv0/+GBHA1DabEFC6fLesl2Mh
         HZkP9hiVhbyw21PNDnanPvH7tSBbbM2frKiDmIqF1z4NTgSs9v31rtZ00msSOkx7vxH8
         F5FVoMPfHHxc0ECdW449lWlLYgLBlP8E9eDPhhDkKBI0efkZmiTnwuhbWiFNrxsQIEQj
         qx6803rZ2SQjZnhIjakbm3njCHVHVnfZ2+Wuvask8MF8p78rFdkQkPm4XFe0KmoX153m
         xsItF+ZGhRwHeR/KbJoSS6VFSWpmmK1n834B810rgpH0y5WYBKt6M3vwTdBGS20pymsh
         52qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Eef8D41PLjKSHdCiM7PwAp3fT3psPNoQPdTMNa31Hpc=;
        b=EXEnuylo0IG3knuAPOWwG+Y3+k4V6RMhQiYypVPgZZetw9vUX25lIssyL1OPcEHkoL
         UubPbiGPh9hc4Kjqg04QT0DaAVRc1XeVFsxAdIxnaP2ZiN55uDAfMSTcYhIJsVWDB83O
         AZ2IImR5TZSRnUPrpp2vZ406A9WtjfW+Wl7uvTb9dCsw8BCIWaFxIr2Eqh8IQU8EM1TG
         i+d6SrRk2VCNk4M0hMcguZuJ8BfiNY1XTpRBX6E7dR3gDjLhVk0wV5hV2BmtRTnucPf9
         xjsOJpkCRlH+jr05O5TKq0cCd0mFldW5dGFHgYAHtOcLTryjpSF5YJ2Xh9v8VqK5dwns
         Zzjw==
X-Gm-Message-State: APjAAAW9aZfhAD8BZk6vpTNG/F48NRfVpitNsBjp9FZ0yGUpeTaCMEu0
        dnm2UOOmfVH7S8Mh1WHEODs=
X-Google-Smtp-Source: APXvYqx6uWqiHMdeClEUDt+kr1i1QZkj+2msfvUpxQw7Xo2LGQUZurWyIAB+EqjnYrQiMJEmsEmu1g==
X-Received: by 2002:a1c:5602:: with SMTP id k2mr3442371wmb.173.1561673680839;
        Thu, 27 Jun 2019 15:14:40 -0700 (PDT)
Received: from [172.30.89.46] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id x8sm883828wre.73.2019.06.27.15.14.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 15:14:40 -0700 (PDT)
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
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
 <3797cdd2-f6c8-f23d-788c-b8efc3e75b21@gmail.com>
 <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
 <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com>
 <1561624997.4216.11.camel@pengutronix.de>
 <CAOMZO5D1Lq7MuK55hydP3JNGki71iNeubzfUgAvVhEDuzDcZFA@mail.gmail.com>
 <1561640172.4216.16.camel@pengutronix.de>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <f5cd9e34-48c3-897a-2ac2-20d442932423@gmail.com>
Date:   Thu, 27 Jun 2019 15:12:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561640172.4216.16.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 6/27/19 5:56 AM, Philipp Zabel wrote:
> Hi Fabio,
>
> On Thu, 2019-06-27 at 09:38 -0300, Fabio Estevam wrote:
>> Hi Philipp,
>>
>> On Thu, Jun 27, 2019 at 5:43 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>>
>>> Are there any visual artifacts in the first frame(s) in this case?
>> I do not observe visual artifacts when running gst-launch-1.0 v4l2src ! kmssink
>>
>>>> So in my opinion the next version of this patch should make LP-11
>>>> timeout a warning only, but keep the error return on clock lane timeouts.
>>> I agree.
>> Here is a reworked version of Ezequiel's patch as per the suggestions:
>> http://code.bulix.org/g5qap5-780475
>>
>> Does this one look good?
> Limiting the change to wait_stopstate is fine, the actual message
> makes assumptions that could be misleading. How about:
>
> "Timeout waiting for LP-11 state on all active lanes.
>   This is most likely caused by a bug in the sensor driver.
>   Capture might fail or contain visual artifacts."

Yes I agree that is more descriptive, if a bit wordy for a kernel error 
message. I think it could be reduced, something like:

"LP-11 wait timeout on all lanes, likely a sensor driver bug, expect 
capture failures."


>
> I'd like to keep the phy_state register output though, if only as
> dev_dbg(). It contains useful output for debugging, for example if only
> some of the lanes are in stop state, which could indicate an issue with
> connections or lane configuration.

Agreed!

Steve


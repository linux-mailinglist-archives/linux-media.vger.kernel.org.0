Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3B7574E9
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 01:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfFZXaA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 19:30:00 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:44937 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfFZXaA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 19:30:00 -0400
Received: by mail-wr1-f43.google.com with SMTP id r16so227169wrl.11
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 16:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=q0FFvmtOww7F8W7gkS5KM6RHmyZu8Bv1/MD1qApE4N0=;
        b=Xt6w4jSWJuKru0sZNRJHwA/runiwYioPQazxaRm7KfOh7oJfmn8NMuvta9cRjd871i
         WHTAukw5wUd6UPEq8UnQYF69fyLws6/eS9432jgXmTPEGoJ0S2soJfN/QPNsKtHDoZyX
         xipVfeFIOVXi23nWJvuye2HMNW/2ic6oailI+HkbaWl8+7ry0687rKuPftNbsyk4qLR0
         R7ebzhaSrR/z7qxQTayhAfxCWkzuH7c2EgB3Q92pbXP/51y2118e9p/LDBLVv4C6kowO
         veIfnMpedGUiW6O/ma5cEtPQ48p8IAZhAPF34uiHTtGWhtDupDFatOf3+5b3W+1iEZOt
         /Nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=q0FFvmtOww7F8W7gkS5KM6RHmyZu8Bv1/MD1qApE4N0=;
        b=k/HQjUmrnnh9NgXRXizwTKyQN8blD5rLTvjZ+f2chN4QaSHM87H+pRWsyH7CE8rwM0
         QRJc90R2ph4v3br/kHY3TFFoI+Ien8UnKqIBwJxa778b9TrC42Y99BXNKTPEK+T3Oo4C
         Bb89GqWiL/JqdY5r487THwuVddXaqYGjNONF7VuN614kcfkeTAr2RxF4HieTiowAk7Ot
         /g0CTpheBaL4lzDQzRhjXhzJ095Eb1jPvWVlCNegdLk5hjqumqBujXiChm9UKkGT7sI5
         uKPJYK2L33oWueXLNEOSVJlqEnw79ODdccolVZBXLyN7GxnLEobFsBB1Am1hWHw/xssO
         g/UA==
X-Gm-Message-State: APjAAAWRpi5TYsjX7GhQRXhaHkBtwKRW4tio5MP9dxeBwBg9vPUD7i6b
        lJcuecY4iA2/wYq7DRTcftM=
X-Google-Smtp-Source: APXvYqxx5uHXYBFDJa2PiHo/Lz0Rf36Hzv3a9hSxxo6blhUvNTWkE5DHQU8iD1cz5dVmfVh5YqL5sg==
X-Received: by 2002:a5d:664f:: with SMTP id f15mr247848wrw.214.1561591798168;
        Wed, 26 Jun 2019 16:29:58 -0700 (PDT)
Received: from [172.30.90.108] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id l1sm867759wrf.46.2019.06.26.16.29.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 16:29:57 -0700 (PDT)
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
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
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <ba0f4a0f-cb61-6c5b-1db9-21536ae38c6f@gmail.com>
Date:   Wed, 26 Jun 2019 16:29:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AGZcsrzogzxRo9UNauYgWZLdiVE8vJ3-FxU2X4K8Jwxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On 6/26/19 4:22 PM, Fabio Estevam wrote:
> Hi Steve,
>
> On Wed, Jun 26, 2019 at 6:19 PM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>
>> Did you only get the LP-11 timeout warning message with this patch on
>> the OV5645, or both the LP-11 timeout and clock lane timeout warnings?
> With this patch applied I get only the LP-11 timeout warnings, not
> clock lane timeouts.

Ok thanks for the confirmation that the imx6 CSI-2 receiver is able to 
successfully move to stream on without seeing the LP-11 state in this 
case. So in my opinion the next version of this patch should make LP-11 
timeout a warning only, but keep the error return on clock lane timeouts.

Steve


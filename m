Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E0F73834B
	for <lists+linux-media@lfdr.de>; Wed, 21 Jun 2023 14:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbjFULN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jun 2023 07:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbjFULNY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jun 2023 07:13:24 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105E219F
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 04:13:22 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98934f000a5so223183066b.2
        for <linux-media@vger.kernel.org>; Wed, 21 Jun 2023 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687346000; x=1689938000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iUXdQtUDPb9Ggmn6wVlKaK9PtP3dZPjwZcKdxRJgZJo=;
        b=FYt0KhnCYS4Sun7Oh2BKsve5pz72ZaT7sxgdBjMK6jMz/EDNBcD48RcOWsLxHQVNhN
         k04VcbHfRPUBbXn5FrjVL0BteBT2awHzyTiYr38Gu654APIf1NbDGEaoFW+O42yRmeYy
         L4JNGHUQbrpu83FzlqWINUrG8C/NN6zJydwS5+li1lKN6F+CfYVkeFs7LApz5xcvqqP2
         0OC6hQB0YXQIHYKA+oZHFbaNydEDPOxU7r0MDZyCH2i+Qm5Fy2K3n2qoygziaamTiFNN
         gPnRtXz/p9aJQTDO9QNy9I4RrLZz+QDmnCVmDAw3NeQkBzJwV8CPnA1n125nt1v/lbQm
         MiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346000; x=1689938000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iUXdQtUDPb9Ggmn6wVlKaK9PtP3dZPjwZcKdxRJgZJo=;
        b=fX4ijtK8cTMRctGWXtXr8bvpC57EConUhm+kGkvRg3NrDIF+blvR7iF48yHhyj8Vok
         NqRVfzNYvHx5NBvwCvK2Pbi34g8UTMO63GzvIX6TR9KuB5Noe45A5ntF0qPoghovAZgc
         xWlIS8JA99zSpBxjG1cBXYKkOGmi2RBqLlCrNJq3l44rBSeRWrqgYiMnYjFMf9+J82si
         FCJZkKitcJw1bFARcky6MTPduTSzF7D+U8c1zciIrztxhuLetJC7kbkeTJ87ZshEuoTf
         Gc4yJ7dKRYU/tLP8WhS3beF6jzSq1gCwUeJFVxi0N5Q6Q9oVv118VotD0GC7cVTj+lIO
         4pYQ==
X-Gm-Message-State: AC+VfDyYM5Fg2rQQZnoEY9Gzn2S5/Op5XiD4xHiiwtI3KX07pWKrVO7G
        FXmgs5tb/Pc1z5cSQJ4GVOeB5A==
X-Google-Smtp-Source: ACHHUZ5lEurz3Tk5KBdB4xWqwYLad1q1cw2XYM5BoZPsqDgkn5rliMY8I3dkFMkw6V7SsZ4UZyvx5Q==
X-Received: by 2002:a17:907:97cd:b0:989:5a7d:f43a with SMTP id js13-20020a17090797cd00b009895a7df43amr2726340ejc.66.1687346000214;
        Wed, 21 Jun 2023 04:13:20 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090685ca00b0098873024c95sm2997823ejy.136.2023.06.21.04.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 04:13:19 -0700 (PDT)
Message-ID: <d57dd954-b36d-95a5-91c0-c1cfb7290dc0@baylibre.com>
Date:   Wed, 21 Jun 2023 13:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/5] media: dt-bindings: mediatek,vcodec: Don't require
 assigned-clocks
Content-Language: en-US
To:     =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20230607205714.510012-1-nfraprado@collabora.com>
 <20230607205714.510012-2-nfraprado@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230607205714.510012-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2023 22:53, Nícolas F. R. A. Prado wrote:
> On MT8183 it's not necessary to configure the parent for the clocks.
> Remove the assigned-clocks and assigned-clock-parents from the required
> list.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


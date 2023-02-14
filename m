Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5B19696413
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 13:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbjBNM7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 07:59:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjBNM7g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 07:59:36 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709D7273A
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 04:59:35 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id E579B6602167;
        Tue, 14 Feb 2023 12:59:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1676379574;
        bh=YACKE1U6SYZ9SIAE3LuSN9f7yWCVTAqrQdKWMCXVNho=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RdFSxGRDsxMfO7jhy6OcTnFEnwZC1QoHvFsRHghTjzChobzX8FS6c6owieYtMqqHL
         PX0wPOyGfPyePFjqjhWqMhEtKNYwFhF7nHkLeaJk2x63eM39pQsHQtjaC93NnVnT0S
         yZVVidkmxqyVRhOkC80Olqt13x6l9uFxBtpN1HTqeF8TrqPDuFR76GpTbIxR+3DOyW
         VcdPllnL6psBdrGM+Vlw7KGH1asR2/ppJ7xSdXF1y9m9pnFu7w+wI6jPHPybK6PIfR
         sE28uCVV3lGkMFcWf4n26jkyNwPCog0zNvC4wb6w2hhCtipXcKdsZwixKNGgIYD4Qf
         yxoiY/rTcBdJw==
Message-ID: <68122d93-fae2-9904-7cf7-518811a874c7@collabora.com>
Date:   Tue, 14 Feb 2023 13:59:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6] media: Add AV1 uAPI
Content-Language: en-US
To:     Daniel Almeida <daniel.almeida@collabora.com>, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20230214124254.13356-1-daniel.almeida@collabora.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214124254.13356-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 14/02/23 13:42, Daniel Almeida ha scritto:
> This patch adds the  AOMedia Video 1 (AV1) kernel uAPI.
> 
> This design is based on currently available AV1 API implementations and
> aims to support the development of AV1 stateless video codecs
> on Linux.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

For MediaTek MT8195, Cherry Tomato Chromebook:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


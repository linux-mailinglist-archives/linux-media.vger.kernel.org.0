Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4997D2D59
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 10:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjJWI4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 04:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjJWI4w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 04:56:52 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EB3A9;
        Mon, 23 Oct 2023 01:56:50 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6500F660708F;
        Mon, 23 Oct 2023 09:56:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1698051409;
        bh=dFvx+49S3jFnjbYP/SDDTVnsInLkM7iL6PkoHtIthX0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=RVEWfNph9KqE4Mw6VpLodWjXCU7tkP1G4gPeA8oZlDQDYvFHMonzcvegivjtuR+6O
         MuTAoFZnfyuIfml2eGL9n8iWHiTXVaphfrcjswc4g4irTF4L9xOAVD8n01gGUSgd2d
         Kk2mSmsawIkFL8l4qKcUMktO6VEXfaOMvF62HywGQGJn8crXHZvogvfkn2CALdlNg5
         fNmLuQ+qgg9PEi25UhA2rPp60RedCock6MdA0+Fjgh3ESlZoNWPpIAGHn7RLKMRmgV
         zokbhLQBjzj/YXXBjhU9kO1n56xrvm6C40rP1IaLq15JnuhVOfatBgzuBeGrGGxoBN
         2HIeAA/O3N3xQ==
Message-ID: <5bdb0e3a-e3d9-4014-8f0b-014f8d2f6f9a@collabora.com>
Date:   Mon, 23 Oct 2023 10:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2,7/7] media: mediatek: vcodec: Set the supported vp9
 profile for each platform
Content-Language: en-US
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= 
        <nfraprado@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nathan Hebert <nhebert@chromium.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231023030640.16393-1-yunfei.dong@mediatek.com>
 <20231023030640.16393-8-yunfei.dong@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023030640.16393-8-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 23/10/23 05:06, Yunfei Dong ha scritto:
> Set the maximum VP9 codec profile for each platform.
> The various mediatek platforms support different profiles for decoding,
> the profile of the codec limits the capabilities for decoding.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


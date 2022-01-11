Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC9948AAAD
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 10:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237452AbiAKJip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 04:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236860AbiAKJip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 04:38:45 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D2BC06173F;
        Tue, 11 Jan 2022 01:38:44 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: kholk11)
        with ESMTPSA id 769901F443C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641893923;
        bh=Q/6Me6ojHK+rFOvurOL4GOexW3JhCSYadj07qWCpmxE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bkXPEBQax6aQFrFKuKmdW/MnM/6LD8uYLLroGHSqlmSh+MmqBwb+AbrViUzS6wS0N
         pq112rFRNhah3eBTk/KiqBkAt9U15FluP+2Aqpj1wL6w8CyQRVOY9Ysr4dRhOY1oMt
         yhtTkuKgsxLAvRuOZgwbtRbq//QzWs//aMFR/mJbr+QTQtzSDrDQZLU9oesg7HGqNc
         upJnAE2MibKDANZVTSV7uv27vjHt5ZFm3gfcAwYLkPzFFJndvb/wjB121UJ0OXK4M2
         plESTxwCCI1vWbS88X1x2GwCPBWtJY2+o1Y1Aeb892nITs8rZt3EDbbX8F3cAMBYIy
         xW748duNx3lGg==
Subject: Re: [PATCH v11 1/4] soc: mediatek: mmsys: add CMDQ write register
 function
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Landley <rob@landley.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>, tfiga@chromium.org,
        drinkcat@chromium.org, pihsun@chromium.org, hsinyi@google.com,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
        menghui.lin@mediatek.com, sj.huang@mediatek.com,
        allen-kh.cheng@mediatek.com, randy.wu@mediatek.com,
        jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
        river.cheng@mediatek.com, srv_heupstream@mediatek.com
References: <20220104091712.25670-1-moudy.ho@mediatek.com>
 <20220104091712.25670-2-moudy.ho@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Message-ID: <39e4ab28-be15-f06c-e444-5f84cf08aa52@collabora.com>
Date:   Tue, 11 Jan 2022 10:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220104091712.25670-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 04/01/22 10:17, Moudy Ho ha scritto:
> Adding the interface of writing MMSYS register via CMDQ,
> users do not need to parse related dts information.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>





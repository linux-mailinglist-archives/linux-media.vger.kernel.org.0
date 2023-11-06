Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 809F97E2200
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231626AbjKFMov (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjKFMou (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:44:50 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D31F3;
        Mon,  6 Nov 2023 04:44:45 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C36AE6607482;
        Mon,  6 Nov 2023 12:44:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1699274683;
        bh=+ayWnCIJkXFbMbvFLWZ8twgHit1NMR0N6o/rMjRk7Nk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WuNhD0AhVAtckAur993ehd0flOlQec9k7sNhWu6wiS1x5UPjlcMLW+Qlb6cI/n9m3
         v92XUFmkQ9hPW6sKVEFZYCqT5uPWyhO+KwCDeBF0afCsgYMNCpmcRnk8SEzCdt3teK
         t10brGh2UiWLk1DruW7jP5vuWIM7f4hzb9BrqH/viAY3/iE2ovO+vaiBJB+3x49UvN
         Ro74URxDunE4mIkcGkWcSarXB4egRSmqzDVfA4r2NdrEkW8oXaHZk8r783KUhYnEyv
         kT6H+y3JfiZSatGnhDBDBioXEpP/J0J5AzYcMD69ZxkYIiyLo/h5RRDS2/k67fc59z
         GrbV1QaokQ6ZA==
Message-ID: <646ef874-dbbd-448d-8b66-d847f3f8e268@collabora.com>
Date:   Mon, 6 Nov 2023 13:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/12] media: platform: mtk-mdp3: add support for
 parallel pipe to improve FPS
Content-Language: en-US
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
 <20231030100626.12564-13-moudy.ho@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231030100626.12564-13-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Il 30/10/23 11:06, Moudy Ho ha scritto:
> In some chips, MDP3 has the ability to utilize two pipelines to
> parallelly process a single frame.
> To enable this feature, multiple CMDQ clients and packets need to
> be configured at the same time.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


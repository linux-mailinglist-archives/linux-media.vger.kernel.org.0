Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2F53DB6E5
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 12:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238482AbhG3KJp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 06:09:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48286 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238374AbhG3KJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 06:09:44 -0400
Received: from [IPv6:2a02:810a:880:f54:51e7:d967:c146:d0c] (unknown [IPv6:2a02:810a:880:f54:51e7:d967:c146:d0c])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 98A291F446BD;
        Fri, 30 Jul 2021 11:09:37 +0100 (BST)
Subject: Re: [PATCH v3, 01/15] media: mtk-vcodec: Get numbers of register
 bases from DT
To:     Tzung-Bi Shih <tzungbi@google.com>,
        Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <20210727101051.24418-2-yunfei.dong@mediatek.com>
 <CA+Px+wUXmpT6TBOvD9J6ircLQ_X5D=bByOotfk+L7U+sXev3nQ@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <c6ecd39b-a756-b1b7-3191-6d9536f72b87@collabora.com>
Date:   Fri, 30 Jul 2021 12:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUXmpT6TBOvD9J6ircLQ_X5D=bByOotfk+L7U+sXev3nQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 30.07.21 11:31, Tzung-Bi Shih wrote:
> On Tue, Jul 27, 2021 at 06:10:37PM +0800, Yunfei Dong wrote:
>> +static int mtk_vcodec_get_reg_bases(struct mtk_vcodec_dev *dev)
>> +{
>> +     struct platform_device *pdev = dev->plat_dev;
>> +     int reg_num, i, ret = 0;
> ret don't need to be initialized.
> 
>> +     for (i = 0; i < reg_num; i++) {
>> +             dev->reg_base[i] = devm_platform_ioremap_resource(pdev, i);
>> +             if (IS_ERR((__force void *)dev->reg_base[i])) {
>> +                     return PTR_ERR((__force void *)dev->reg_base[i]);
>> +             }
> { } can be removed.

I think that also the "__fore void*" can be removed

thanks,
Dafna

> 

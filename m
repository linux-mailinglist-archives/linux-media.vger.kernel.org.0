Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE5F23C80C
	for <lists+linux-media@lfdr.de>; Wed,  5 Aug 2020 10:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgHEIqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Aug 2020 04:46:00 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59511 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725963AbgHEIp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Aug 2020 04:45:58 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 3F3Wk0EzyuuXO3F3XkjXt6; Wed, 05 Aug 2020 10:45:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1596617155; bh=E3G95BLyAUJmVusMMfwPa0XjRXL7LH/JhsGHryHhhqk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NwhhO7yJ2w0SLPOlQCTV8HVXR3hQzzG8bBAd/ba0hx4r1MDZxJvLxJrSRfpFbHfJ7
         pC6dvxXxPov+DBJUfiIWNvAsqzYcIJ+FbJCflEwJs+iuaTr48ZIZh/H3/cyA3bkypF
         q0oOWJ7auAVO8hiOIxJtoC0ZH8EVug30KAGweyu3TZQaTC1wwdcY4UvY431Gr31zsD
         y0mqAYuy0z3F4nWoSzVEr5DerN5Fb9m0ziv2r85J4ziv9NWwg03YPS88/Ii5HsmG/z
         GCmVJGtat7FD67uivHpRlsQcjz3HXZwQyqvm1WdMea/12If0i3Xj4ftCviGB68E/7Q
         0kXxxSW9KgoQQ==
Subject: Re: [PATCH v11 00/28] Add support for mt2701 JPEG ENC support
To:     Xia Jiang <xia.jiang@mediatek.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
        senozhatsky@chromium.org, mojahsu@chromium.org,
        drinkcat@chromium.org, maoguang.meng@mediatek.com
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <dc3d16ad-fd05-5bab-8a16-dc5ba0ef671c@xs4all.nl>
Date:   Wed, 5 Aug 2020 10:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfM7apDStT39H88fUqokBMwpoJPCF/emODIBQNG2aBDzuduKXhUGZyGxV4hNcIqRe1VY8xCHijxo80J9WV3GPg3QX8WtWlOWmC9OxmHAa8gSMTRS6zvb7
 ozMn/nkVzm9eerHLW7F1evmUUnKxklzfb9jl06WuE5hFwg2X/aduIzDWnmnbkKIKCingeCHlQwMlNxCKP9ingl+Ho1ccKha9X76Dm27fef7U4vUPB3uPFRD3
 SDFouRLttkjtidgZnIg7+2h0Qt5ka4rIOR3HqqIR29WRXwUw8RLN1e3tkPXiSUeuzMv3XPe6fzKB3xHKtkRu2duDB+P5G6dNv9oSC/QKiVZP8yzgEul/YhVX
 BvBbD9au2S0ZEYAGwzBYPRqiDQzAy9l7PrUpmjXurd0Q8LQ5fpJoq7fSzegrIFAC2gw6EX6WqNF6PmJoP68nAPdOxxGudJ91X3LwXklUpt0q9q20LMPB+0WK
 0SY5EZREdv4xlEgOJg0MDJqp7UlUXsgYxldnQPQA92VNv9xnov6b/0HRUr4qdPSMFY8weKuspmmoT4Dg4AGosynjxE+rR9213yllcnkbGwMoQbjnMNc8eCNX
 WOoVtGx2x10wTbPLrDekAhr2vEobzycrLDNtHMxrPFq270LiQuPfwsNAoViPVOwTylkn0UrSzhBM4+WQguWxwdaNxP+Hg6tNdYVuEMWh3i48n/K8CUckts1a
 fOS/KoewWfa9D9N3Kh3xpLse7sadizs2u6VyNkoE3Bsb/WOivHbe7HA48IRSGg2VhFiuk3cK8zVtr53QTiBQRLygiLGf3PdhNRvC4APxE7dsDjo8Wn2j2W4E
 SZvx5FEVMse3C1lVoDHYpiqWdypcxUl0nlvgxwFBTzMjTfYoE3rmE28QI++1Fg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/08/2020 05:40, Xia Jiang wrote:
> This patchset add support for mt2701 JPEG ENC support.      

I'm getting these compile warnings/errors:

drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function ‘mtk_jpeg_enc_device_run’:
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:917:27: warning: variable ‘jpeg_src_buf’ set but not used [-Wunused-but-set-variable]

  917 |  struct mtk_jpeg_src_buf *jpeg_src_buf;
      |                           ^~~~~~~~~~~~

It's indeed not used.

drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function ‘mtk_jpeg_suspend’:
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1482:2: error: implicit declaration of function ‘v4l2_m2m_suspend’; did you mean ‘v4l2_m2m_mmap’? [-Werror=implicit-function-declaration]

 1482 |  v4l2_m2m_suspend(jpeg->m2m_dev);
      |  ^~~~~~~~~~~~~~~~
      |  v4l2_m2m_mmap
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function ‘mtk_jpeg_resume’:
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1495:2: error: implicit declaration of function ‘v4l2_m2m_resume’; did you mean ‘v4l2_m2m_release’? [-Werror=implicit-function-declaration]

 1495 |  v4l2_m2m_resume(jpeg->m2m_dev);
      |  ^~~~~~~~~~~~~~~
      |  v4l2_m2m_release

This apparently relies on https://lore.kernel.org/linux-arm-kernel/20191204124732.10932-2-Jerry-Ch.chen@mediatek.com/

Please add this patch to this series. Don't forget to add Tomasz' 'Reviewed-by' line.

drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c: In function ‘mtk_jpeg_enc_g_selection’:
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:525:8: warning: this statement may fall through [-Wimplicit-fallthrough=]

  525 |   s->r = ctx->out_q.enc_crop_rect;
      |   ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:526:2: note: here
  526 |  case V4L2_SEL_TGT_CROP_BOUNDS:
      |  ^~~~

This is definitely wrong. A break is missing here.

Regards,

	Hans

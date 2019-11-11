Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6AA5F738C
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 13:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKKMD2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 07:03:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34698 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKKMD2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 07:03:28 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B665228F3C1
Message-ID: <9c46d5a708814082cc0c8a94e53e9e21a12271f1.camel@collabora.com>
Subject: Re: [PATCH v2] media: rockchip/rga: fix potential use after free
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Pan Bian <bianpan2016@163.com>, Jacob Chen <jacob-chen@iotwrt.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Mon, 11 Nov 2019 09:03:17 -0300
In-Reply-To: <1573460902-18563-1-git-send-email-bianpan2016@163.com>
References: <1573460902-18563-1-git-send-email-bianpan2016@163.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pan Bian,

Thanks for the patch.

On Mon, 2019-11-11 at 16:28 +0800, Pan Bian wrote:
> The variable vga->vfd is an alias for vfd. Therefore, releasing vfd and
> then unregister vga->vfd will lead to a use after free bug. In fact, the
> free operation and the unregister operation are reversed.
> 

Out of curiosity, how did you find this potential bug?

Acked-by: Ezequiel Garcia <ezequiel@collabora.com>

Regards,
Ezequiel


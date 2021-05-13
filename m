Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14191380006
	for <lists+linux-media@lfdr.de>; Fri, 14 May 2021 00:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhEMW3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 18:29:02 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33782 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230213AbhEMW3C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 18:29:02 -0400
Received: from p5b127fd3.dip0.t-ipconnect.de ([91.18.127.211] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lhJo2-0007L6-7Y; Fri, 14 May 2021 00:27:46 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 17/25] media: rkisp1: use pm_runtime_resume_and_get()
Date:   Fri, 14 May 2021 00:27:45 +0200
Message-ID: <4108655.ElGaqSPkdT@phil>
In-Reply-To: <cd3a667a75a34288a72ba4da5952076a82620520.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org> <cd3a667a75a34288a72ba4da5952076a82620520.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 6. Mai 2021, 17:25:55 CEST schrieb Mauro Carvalho Chehab:
> Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> added pm_runtime_resume_and_get() in order to automatically handle
> dev->power.usage_count decrement on errors.
> 
> Use the new API, in order to cleanup the error check logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



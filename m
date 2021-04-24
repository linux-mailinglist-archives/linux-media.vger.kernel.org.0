Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AE436A38C
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 01:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhDXXVt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 19:21:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53376 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhDXXVt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 19:21:49 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 4C6201F42EA5
Message-ID: <a43aa8ef1f3b198a5a3c3e9196eb945f88d2108a.camel@collabora.com>
Subject: Re: [PATCH 11/78] staging: media: rkvdec: fix pm_runtime_get_sync()
 usage count
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Date:   Sat, 24 Apr 2021 20:20:53 -0300
In-Reply-To: <978ba3b7acceb858870c8029f761ae47ea59563d.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
         <978ba3b7acceb858870c8029f761ae47ea59563d.1619191723.git.mchehab+huawei@kernel.org>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2021-04-24 at 08:44 +0200, Mauro Carvalho Chehab wrote:
> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks a lot for taking care of this.


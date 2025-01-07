Return-Path: <linux-media+bounces-24312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA6A034AF
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 02:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F41B163D64
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 01:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31F986321;
	Tue,  7 Jan 2025 01:52:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D795680;
	Tue,  7 Jan 2025 01:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736214723; cv=none; b=XTPX51wLoI2jLmgL8IUlMBiURJjMu6DNEVkzIj2RpEaZ6SUTNcg+7rm/pXHXDKpzwCE+q2KqCuQEdwD0FA74+iV5xcwcIbZ4amKWe3g+RR1FmAao1TS0H4ZxxITAzG2Fbwci9BjBVvNy9oLwA+lAYq/KHNP8J/J7CM+AlQCMlrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736214723; c=relaxed/simple;
	bh=quvhAzT80nG4AD8ThJEqAEvGV4/DMVoxI6LmdY9YVe0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BIkUMepclYNbzJPwl7u2IpxSwicliXFjmDgLvDeiUo+zQgrVWW8iU1qZLg8fRjIUqpVxbm6sMWtWFeBq/VPIpvzBsSJETogitXUEct2Kaa2y46dvgO/BEammNAnaMKTyNidb4UXUOtuIOPRAhPKxs68z7Jw2T1FyTFp7SwmEGN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-01 (Coremail) with SMTP id qwCowACnrNCviHxnsKHfBQ--.20039S2;
	Tue, 07 Jan 2025 09:51:52 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: sean@mess.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	make24@iscas.ac.cn,
	mchehab@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: lirc: Fix error handling in lirc_register()
Date: Tue,  7 Jan 2025 09:51:43 +0800
Message-Id: <20250107015143.655306-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Z3u2zVQyammNo_o3@gofer.mess.org>
References: <Z3u2zVQyammNo_o3@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnrNCviHxnsKHfBQ--.20039S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jr4Dtr45KF43AryfZw43ZFb_yoW3KFX_CF
	4093srWw4xJwn3ta9Ikr45JFZI9r4DKry7X348JFWxu34rXFZ8Zw4DJrn0gry3ur1jkrn0
	gFy0qr45t3sa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAq
	YI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUejgxUUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Sean Young<sean@mess.org> wrote:
> Hi,
> 
> On Sun, Jan 05, 2025 at 06:01:01PM +0800, Ma Ke wrote:
> > When cdev_device_add() failed, calling put_device() to explicitly
> > release dev->lirc_dev. Otherwise, it could cause the fault of the
> > reference count.
> > 
> > Found by code review.
> 
> Interesting find, thanks for finding and reporting.
> 
> So I think the idea is right, but there is a problem. lirc_release_device()
> will do a put_device() on the rcdev, but no corresponding get_device() is
> done in this code path.
> 
> 
> Sean
Thank you for your reply and suggestions. Following your instructions,
I took a close look at the code. Perhaps you meant to suggest removing
the put_device() call from lirc_release_device(), effectively making 
lirc_release_device() an empty function? 
Looking forward to your reply.
--
Regards,

Ma Ke



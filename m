Return-Path: <linux-media+bounces-46285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FADC310B0
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 13:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6403B420A51
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 12:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EC7212542;
	Tue,  4 Nov 2025 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Ei/a/lA6"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65514CA4E;
	Tue,  4 Nov 2025 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762260389; cv=pass; b=fafjJNzM4hfqgtuQswkMZSTglXPjucGW1Rbv/cq0oZAlnVMIGjkeYd9A7KrkLgc3KpGCDFgnv62jVMMEVtGcAfS71vh4uSUkApD4FiRUlaeuBUbqKzvf/9k96PK53ZOJ23z883Hd9Gxj6ateNU1/Y25kgaVN4iuHQtU1Z0zeh/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762260389; c=relaxed/simple;
	bh=2oAR6ncZXk23aiYjvazgP8Am0wyhI111b4liQP4g/yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0eVFgABXSIWLhOFShWAw0AeKv4Qg9ivEQB7nJ3QIrwJbMJaDbO++NCHn2Pzii/88eM3Z5Jdt0oJCXD9ik3c5rgz4PgULcLQmgtl1t+5AMzbkjWXLz5zE9UOCPeM9glorK6nYO6h6MnDECgusCHxZHPkQZ3rKWonCTAiNj4Id0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Ei/a/lA6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1762260360; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d6BEUv02+O96FugBx8Dp8Q9sbM9LDy4ELpi92W09WGguY39v7sYZb7iI6rCXfWHmUkLgAQ5NRu0ho3FBgfqI4KftRrI9TPiR7RW9s9OVKHUdREXgszi3c/uLPt0L94XsAxv33gUE8risF1kZ4V+0cWQltsfHcT5NdOC0EUQ4wqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762260360; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f/tqjFFzKGh+Rl0E2XWAumu2bPWdxjKVkXS4gNXPK6w=; 
	b=YIFMBQ7TppXcsUMDn9youjb9gOzjzbDhPx9v6fhcn8QIb5+5zEY/oCOqrO3dJDE9Czs3gJUKoxT9t39fj+mxUL8kr4wV8cJOfEvM2GJvzsfprnMwzFxr7wFf6EapebBmah8jLNJtBjh2Ppetqk7Hl1E26pdtMbtxBlTFt39LqJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762260360;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f/tqjFFzKGh+Rl0E2XWAumu2bPWdxjKVkXS4gNXPK6w=;
	b=Ei/a/lA6vMWtgnHLrza6oyHgTCfkFHGhqI1Ds+2lxs3a92m7R8anv9IkO3f02Zlk
	/Kt1GyCVBGwbiPFu6m06W6uUp4GmmPrL8lblbi/L/640QiZCP50eLE9gFMCL/OEfgNq
	S/UsZLF9hs/pJieZ9/k89n4aKfrxJSrEx5PN72+Q=
Received: by mx.zohomail.com with SMTPS id 1762260358951359.41079397626913;
	Tue, 4 Nov 2025 04:45:58 -0800 (PST)
Message-ID: <5ce483e5-7384-4d63-8dac-8050c2bd5930@collabora.com>
Date: Tue, 4 Nov 2025 15:45:49 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: synopsys: hdmirx: replace use of system_unbound_wq
 with system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 kernel@collabora.com
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251104102048.79374-1-marco.crivellari@suse.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20251104102048.79374-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

On 11/4/25 13:20, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> This patch continues the effort to refactor worqueue APIs, which has begun
> with the change introducing new workqueues:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> 
> system_dfl_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
> 
> The old system_unbound_wq will be kept for a few release cycles.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index b7d278b3889f..da6a725e4fbe 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -1735,7 +1735,7 @@ static void process_signal_change(struct snps_hdmirx_dev *hdmirx_dev)
>  			   FIFO_UNDERFLOW_INT_EN |
>  			   HDMIRX_AXI_ERROR_INT_EN, 0);
>  	hdmirx_reset_dma(hdmirx_dev);
> -	queue_delayed_work(system_unbound_wq,
> +	queue_delayed_work(system_dfl_wq,

Took me a minute to find what "dfl" stands for. Would be great if the
name was self-explanatory as system_default_wq. Even then, not clear to
me what's the point of this remaining, the system_dfl_wq naming feels
very obscure compared to the explicit system_unbound_wq.

Could you please explain the logic behind the new naming? Doesn't it
create more confusion than remove?

AFAICS, right now system_dfl_wq duplicates system_unbound_wq. Suppose,
instead, the default wq could alias the system_unbound_wq.

-- 
Best regards,
Dmitry


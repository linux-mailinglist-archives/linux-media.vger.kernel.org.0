Return-Path: <linux-media+bounces-43008-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9436B98794
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 09:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE00D18839F0
	for <lists+linux-media@lfdr.de>; Wed, 24 Sep 2025 07:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD8026A0DB;
	Wed, 24 Sep 2025 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="LqJK2N2q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69EC141
	for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 07:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758697786; cv=none; b=DXSQ4xuUPXg5IK7+Z4BwvpcNuRRrdvi3VGzKMa9hVKnKV5ZakTXe8Sq4TtJGcMu4VVkVC7auNo93DFUyfy8Zq/BPTFdYsHpwVdKjTZwAGHTccS9riVeTUzuAfAiTECNN8l/Ky/OfYKr7fRFv/PLELV8kQc0uG9c5CQ7Udh0r4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758697786; c=relaxed/simple;
	bh=Bm/c0U+QlEQD70i9efmaOmqjKeHojdywtKbcNpxruKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3Ah16PH5Cjn+DTRSo9Ul+3a6RASvyN5A8XMpHecaGwet/0bkmgNcW+5ddzo+Y6rs5wK0dxvaegGY9QPkkWvTwI5YKrLnVsLfomw1co41NtV7usxfBxC03LbOkYfhFWl/VS0iwkVgAd75sVKClswNu3440pgEJWg0ej3j/166bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=LqJK2N2q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so4703643a91.2
        for <linux-media@vger.kernel.org>; Wed, 24 Sep 2025 00:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1758697784; x=1759302584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MGSaf7ZfJ7JsnmRy0rZ4O/HGoiqMzyG6S1rWloOryz4=;
        b=LqJK2N2q0XpLaz4JSfd8Noz1othgNxtoa2AIDuQqf2l3UdYipS0kBQwpH2ymojnyMF
         IWzDeWwojeQnXBUEWaQA85cOI6ZOS5zvPOFBqu5ufvUOKiXjpeHj3982iVLht1l5nUV5
         Of9zVN5IqOc4hO6L0ZjplRb7h3VUvp0Ehqg/PQkpohTavk/b+UtuNu2sb+kklhu+NDoz
         Vg5dbDv+gbnJBow3/Gi+zeAQizq8yzU6tWgTMqBA4kKUKV6FUuJY8+XW6iE/ki5yEl6D
         Tyk0sITh2Kp4KuTNR++H/lcHhsYIt8lnNOt6AoSwCtnoCSu7ptwwr9UKNSGPMQxXU0BM
         lpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758697784; x=1759302584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGSaf7ZfJ7JsnmRy0rZ4O/HGoiqMzyG6S1rWloOryz4=;
        b=PueQXdqKhh/p3VAKa9iAbY1AUVeIHjAqRbxqMO1J22Kz2MX+YOXCMO/bikqkmn94Pr
         yEhf4mrrjby6JWL+5F9CaEMFHz5R2PiNBu/U06mHCOIKV1JmFOu6d7pTUF6011mAREOw
         St+R9QC4m1jn/3iKWjqM6eBAg5Paq+9oUgZFOXmtCBPhd/eoBPUXtFVLV3TIuY7vdYir
         e1o+6QqigjHWlEnC+oCX+eAXZyDiDulvXgxmUd88uMNeZ6AwE8s29lCW8pTqqGbrvExH
         BTv3SHMxT9+0oda+loPZ4Cp9Vq0N0k/uCNhF9b4sTczD9rw0DzdcfPBxWH6yqHLufGko
         nTDw==
X-Forwarded-Encrypted: i=1; AJvYcCVONccZDIYh+yeNMkN1On/fzoyafro6Qjdl78I/EMtx0vuUawU2iBK00R9vv8Mn/h5TviS72DQpQCD6zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+M3cFOdS3tIy+lmek5Eewfoh+MMSIYiCGY2PDGPBunJNJxNmr
	w+r3VQOpGa/SH5fESKWZYzTaZSyHFrZzVWLbyNDv+lt2kazaNIcpuKmgOIDkEH3XCPUk
X-Gm-Gg: ASbGncvele70jq43aI9Qz6hy8ymK3uMyPqLpcG7VJoPDKHc3V1HqfPPZIVQ2lqBa13G
	RAZGFUvSvtjXFZ/VATn0yJpB7u4lVbfQ8wf5Z6E2mO9k89E5tDuSVqgBvqyvJNi0nSjdFZi2ofo
	RrNpmlhwTcCYI/Xf8Dut+lJNiRNWUNZApEC+WKOWba2pV37Bp0Q3nESuURoI8O31hogQwqRiyQB
	XNMxVC8pLeg0h34kqx4upIrRAxBl6L12yKLSdzdQnyUTw18x+7yAGRdh8HR3Qa4c/qMfvTwv9AG
	J/Sp17h9AguNmZEz60/7lGNgtNr0mOZXTA4JM1H1giCa2HExwzLl957V8nWVgH3PGr/f+TFSqYS
	7OYcyH0scj3kelOwSf6Xy0i3o
X-Google-Smtp-Source: AGHT+IHDeqZt/SOvidUlhJ4b4qDw7MYr2ByXSViYNpQQw/M0IMB5DvSzkUwqcAW77jOCcL5kdmG88g==
X-Received: by 2002:a17:90b:4a42:b0:32e:18fb:f05f with SMTP id 98e67ed59e1d1-332a95977damr6615787a91.20.1758697783954;
        Wed, 24 Sep 2025 00:09:43 -0700 (PDT)
Received: from sultan-box ([79.127.217.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be14601sm1314858a91.14.2025.09.24.00.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:09:43 -0700 (PDT)
Date: Wed, 24 Sep 2025 00:09:39 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com,
	Alexey Zagorodnikov <xglooom@gmail.com>
Subject: Re: [PATCH v4 3/7] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aNOZM2fj1X9TfZSF@sultan-box>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-4-Bin.Du@amd.com>
 <aNB0P18ytI1KopWI@sultan-box>
 <df5f52eb-0480-4d59-b930-e8336a993831@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df5f52eb-0480-4d59-b930-e8336a993831@amd.com>

On Tue, Sep 23, 2025 at 05:24:11PM +0800, Du, Bin wrote:
> On 9/22/2025 5:55 AM, Sultan Alsawaf wrote:
> > On Thu, Sep 11, 2025 at 06:08:43PM +0800, Bin Du wrote:
> > > +	if (!mem_info)
> > > +		return NULL;
> > > +
> > > +	mem_info->mem_size = mem_size;
> > 
> > mem_info->mem_size is not used anywhere, remove it.
> > 
> 
> Actually, mem_size will be used in following patches in isp4_subdev.c, so,
> i'd like to keep it.

Ah, I didn't notice, my apologies.

> > > +	for (i = 0; i < buf_size / sizeof(u32); i++)
> > > +		checksum += buffer[i];
> > > +
> > > +	surplus_ptr = (u8 *)&buffer[i];
> > 
> > Change cast to `(const u32 *)`
> > 
> 
> Sure, will modify in the next version. I guess you mean `(const u8 *)`

Yes, it should be `(const u8 *)`, apologies for the typo.

> > > +
> > > +	guard(mutex)(&ispif->cmdq_mutex);
> > > +
> > > +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
> > > +		list_del(&buf_node->list);
> > > +		kfree(buf_node);
> > > +	}
> > 
> > Move the whole list to a local LIST_HEAD(free_list) variable and then release
> > the lock. Then you can list_for_each_entry_safe() without needing to do a
> > list_del() every time, and you won't need to hold the lock the whole time.
> > 
> 
> Thanks for the suggestion, seems that will make code complicated, e.g. this
> is the suggested implementation in my mind if i don't get you wrong,
> 
> void isp4if_clear_cmdq(struct isp4_interface *ispif)
> {
> 	struct isp4if_cmd_element *buf_node;
> 	struct isp4if_cmd_element *tmp_node;
> 	LIST_HEAD(free_list);
> 
> 	{
> 		guard(mutex)(&ispif->cmdq_mutex);
> 		if (list_empty(&ispif->cmdq))
> 			return;
> 		free_list = ispif->cmdq;
> 		INIT_LIST_HEAD(&ispif->cmdq);
> 	}
> 
> 	list_for_each_entry_safe(buf_node, tmp_node, &free_list, list) {
> 		bool quit = false;
> 
> 		if (buf_node->list.next == &ispif->cmdq)
> 			quit = true;
> 		kfree(buf_node);
> 		if (quit)
> 			return;
> 	}
> }
> So, I'd like to keep previous implementation by removing list_del and adding
> INIT_LIST_HEAD, so this will be the code after refine,
> 
> void isp4if_clear_cmdq(struct isp4_interface *ispif)
> {
> 	struct isp4if_cmd_element *buf_node;
> 	struct isp4if_cmd_element *tmp_node;
> 
> 	guard(mutex)(&ispif->cmdq_mutex);
> 
> 	list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list)
> 		kfree(buf_node);
> 	INIT_LIST_HEAD(&ispif->cmdq);
> }
> It's much simpler, and based on our test, for command and buffer queue, the
> elements in the queue won't exceed 5 when run to here, so the lock time will
> be very short. What do you think?

This is what I am thinking (with cmdq_mutex replaced with a spin lock):

void isp4if_clear_cmdq(struct isp4_interface *ispif)
{
	struct isp4if_cmd_element *buf_node, *tmp_node;
	LIST_HEAD(free_list);

	scoped_guard(spinlock, &ispif->cmdq_lock)
		list_splice_init(&ispif->cmdq, &free_list);

	list_for_each_entry_safe(buf_node, tmp_node, &free_list, list)
		kfree(buf_node);
}

> > > +	struct isp4if_cmd_element *cmd_ele = NULL;
> > > +	struct isp4if_rb_config *rb_config;
> > > +	struct device *dev = ispif->dev;
> > > +	struct isp4fw_cmd cmd = {};
> > 
> > Use memset() to guarantee padding bits of cmd are zeroed, since this may not
> > guarantee it on all compilers.
> > 
> 
> Sure, will do it in the next version. Just a question, padding bits seem
> never to be used, will it cause any problem if they are not zeroed?

Padding bits, if there are any, are used by isp4if_compute_check_sum() and are
also sent to the firmware.

> > > +
> > > +	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
> > > +	if (ret) {
> > > +		dev_err(dev, "fail for insert_isp_fw_cmd camId (0x%08x)\n", cmd_id);
> > > +		if (cmd_ele) {
> > > +			isp4if_rm_cmd_from_cmdq(ispif, cmd_ele->seq_num, cmd_ele->cmd_id);
> > 
> > Using isp4if_rm_cmd_from_cmdq() sort of implies that there is a risk that
> > cmd_ele may have been removed from the list somehow, even though the fw cmd
> > insertion failed? In any case, either make it truly safe by assuming that it's
> > unsafe to dereference cmd_ele right now, or just delete cmd_ele directly from
> > the list under the lock.
> > 
> 
> Good consideration, so will change it to following in the next version,
> ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
> if (ret) {
> 	dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
> 		isp4dbg_get_cmd_str(cmd_id), cmd_id);
> 	if (cmd_ele) {
> 		cmd_ele = isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id);
> 		kfree(cmd_ele);
> 	}
> }
> The final cmd_ele to be freed will come from cmdq which will be protected by
> mutex, so it will be safe.

Looks good to me!

> > > +static int isp4if_send_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_info *buf_info)
> > > +{
> > > +	struct isp4fw_cmd_send_buffer cmd = {};
> > 
> > Use memset() to guarantee padding bits are zeroed, since this may not guarantee
> > it on all compilers.
> > 
> 
> Sure, will do it in the next version. as mentioned above, padding bits seem
> never to be used, will it cause any problem if they are not zeroed?

Padding bits, if there are any, are used by isp4if_compute_check_sum() and are
also sent to the firmware.

> > > +
> > > +	guard(mutex)(&ispif->bufq_mutex);
> > > +
> > > +	list_for_each_entry_safe(buf_node, tmp_node, &ispif->bufq, node) {
> > > +		list_del(&buf_node->node);
> > > +		kfree(buf_node);
> > > +	}
> > 
> > Move the whole list to a local LIST_HEAD(free_list) variable and then release
> > the lock. Then you can list_for_each_entry_safe() without needing to do a
> > list_del() every time, and you won't need to hold the lock the whole time.
> > 
> 
> Same comments as above cmdq

This is what I am thinking (with bufq_mutex replaced with a spin lock):

void isp4if_clear_bufq(struct isp4_interface *ispif)
{
	struct isp4if_img_buf_node *buf_node, *tmp_node;
	LIST_HEAD(free_list);

	scoped_guard(spinlock, &ispif->bufq_lock)
		list_splice_init(&ispif->bufq, &free_list);

	list_for_each_entry_safe(buf_node, tmp_node, &free_list, node)
		kfree(buf_node);
}

> > > +struct isp4_interface {
> > > +	struct device *dev;
> > > +	void __iomem *mmio;
> > > +
> > > +	struct mutex cmdq_mutex; /* used for cmdq access */
> > > +	struct mutex bufq_mutex; /* used for bufq access */
> > 
> > It makes more sense for cmdq_mutex and bufq_mutex to be spin locks since they
> > are only held briefly for list traversal.
> > 
> 
> I'd like to keep them as mutex, because 1.no sync with hard/soft interrupt
> is needed, 2.Not very time critical 3.Make guard mutex optimization
> possible. What do you think?

For very quick/short critical sections that don't sleep, it makes more sense to
use a spin lock. A mutex lock is heavy when it needs to sleep on contention,
which isn't worth it if the critical section has very few instructions.

Also, guard and scoped_guard are available for spin locks too, as shown in my
replies above.

> > > +
> > > +#endif
> > 
> > Add /* _ISP4_INTERFACE_ */
> > 
> 
> Sure, will add it in the next version and check all header files. BTW, will
> change the macro name to _ISP4_INTERFACE_H_ to align with others

Good catch, sounds good.

Sultan


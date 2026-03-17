Return-Path: <linux-media+bounces-56134-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI+cMUrIuWl/NgIAu9opvQ
	(envelope-from <linux-media+bounces-56134-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:31:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 308842B2B84
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 22:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E03FE3071F51
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 21:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327C5390C93;
	Tue, 17 Mar 2026 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FjanNGcR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55035224B1E
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773783108; cv=none; b=apAvwIPMMqDGdTq2M+qtcqpnAdbB387aHtMHvMYsWRabxkiUEzo8Y+MwD4cWhFQjgx+y2AyVXdTE/XK2osFZyBYZkPVH6eJ4tKPkiJURoI0sHgpwvbE6LQItqTR/8uMV0TRM2ggWu218kHHIRd9fhF2Jxgl3Cl2VmdlbyXskgAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773783108; c=relaxed/simple;
	bh=f41xpbvBrwGME6qABmA2GdPeYdrIBJyccldd9+SJLPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxbrFEvFX+O6wNmZN8MIqVd5sTgmbjjUZHAiYekRBa89ocOnJpVdVT+UYFMzsMazsvVCf9U9PgIIEV3mAM3uHigUTeASxllWeBOn75uvIDPeB+q78Fv8BdiB24giT1u8XoryVxRtltQVqV92VMMfpCyw2IcBqnPXT/Leb6i9ugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FjanNGcR; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cd78a4ce8dso896018285a.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773783106; x=1774387906; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk+/tbmNYJDDpqpcxbBb9wiWkeRp/nQVJE8CA6ydZb0=;
        b=FjanNGcRBkYwPrOTLyiLl5CmhRjHeLQ/8HAH1dPJYVR/3W7p/b6pZLr23nPetq8ZHs
         EXb2ZrrVKN+gGnNbU8QNqJYzISVs2fEhiZHE5Zzk99EArdX3q0L3hIyEx1GU4to1az8G
         lnmwVikvoUdZ1uzaVdzheLKavGdm2fihxxMqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773783106; x=1774387906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk+/tbmNYJDDpqpcxbBb9wiWkeRp/nQVJE8CA6ydZb0=;
        b=GZzUBv72J0Ejlq5HMiOC6MQS2j3IunwUhhIDIkmzk+VbXOenngVviSmyMTx9gatOQq
         j4aD0KtElylQXKMoR5TfBPwDXcN5B04RzKh1ulguB56zf5lIxi74chsB4xRYjFUXJrJY
         MPAo0d71tcnlo/EF7uS4iuZyaeBSK4c8C/kBf1KWH1OKsoHDSzTqR6l3QZUsTcVpTa2S
         fy7xQBDB+NEVwDGkuJ76aU6Ez1MTXs4xDGESy1ccv+6n0gBHxbQl8rbkSjvtBbeOy8gr
         Yj0SXc7bnygVALw9L35n2dQiLNPYu7z5w0aDpaE3a8c0MIep0lbIA54jHR1FXwude5/g
         wUYw==
X-Gm-Message-State: AOJu0YxeFEW4T1IrtjI0MEa7HvQFTmr7QpQFoXvO6mxFniDERYxAZa5T
	EKnsXjuZzhJM29OrSHY8mzfO8gqu0wcl+ee0OnnXZjORZGYTjoGF8Te4VwjNrL1ztvqFnzzd8KV
	CcBo=
X-Gm-Gg: ATEYQzynumt1Y96c5tEo7sJ289n3Qld2YmAmg84U/vSkev5Q/fhKTNrvs6lDY4c5uX6
	3szDXdXBcsJqtl9ChV2FX3MJf5b50Lmak4HUkl0OetfRnIDtVKZ57K7eavgsVD+/aqYkQC2RCUi
	ZZtCE1ewP50IgFUZ8d3xMaBLLo0d1AAo8GYALQ4nK7yMwaQr4duHtoTQeQrqa/dW2LTEnHYh8d3
	mdr5wibHM7psrPfoeLQxA1vaM/dMfLBw8p3XlD/Rq5IVFKDB5x1WYqDXfntiS4EmIeqB6VHA802
	9hswrTK7k4H4VqlLGCqJEyWmbVOViWkJnZs4TqFKNFHoslsl3QNhZ2uyZU0RAKXkMoGGnhDYloK
	etg3qYRiur6R5jI6f/D7oumulKxpIDVgYFcYZ1q42ERUgntiseuG2PKoykgtB9oUZpnKfcUrY21
	laQP+XSM4xiENagLtqy1as8Ld4Hpi1LpF84pQr2tfU3VkWpUTC8haMyMO0XX+4
X-Received: by 2002:a05:620a:40d5:b0:8cd:91b3:479a with SMTP id af79cd13be357-8cfad37fa92mr162202485a.54.1773783105911;
        Tue, 17 Mar 2026 14:31:45 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad1b62besm61977285a.37.2026.03.17.14.31.45
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 14:31:45 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-899e87b04d8so89034706d6.3
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 14:31:45 -0700 (PDT)
X-Received: by 2002:a05:6214:2b87:b0:89a:61bb:731b with SMTP id
 6a1803df08f44-89c6b4d2b5bmr18246516d6.6.1773783104253; Tue, 17 Mar 2026
 14:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABVreWJdZU1VGp+9yDRPZLdDqvE907QP7njh=Jk_OSD0FioBwA@mail.gmail.com>
In-Reply-To: <CABVreWJdZU1VGp+9yDRPZLdDqvE907QP7njh=Jk_OSD0FioBwA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Mar 2026 22:31:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCvTafdPD5dQxqEncu0W7XzS-1DBHtz+-nc+W64z_9Q6cQ@mail.gmail.com>
X-Gm-Features: AaiRm50BJa8pZWfjdOmYmE5V52uEnsl7-UGsrBt7zq_IfpUQwKSco7eiYC6SwvU
Message-ID: <CANiDSCvTafdPD5dQxqEncu0W7XzS-1DBHtz+-nc+W64z_9Q6cQ@mail.gmail.com>
Subject: Re: Unable to get Realtek Webcam Working
To: Dennis and Linda Willmott <dennislindawillmott@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56134-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,ideasonboard.org:url]
X-Rspamd-Queue-Id: 308842B2B84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dennis

Thanks for the logs. I have not seen anything particularly wrong
there. But most of the early log has been lost. Maybe you could do
something like:

dmesg -c
rmmod uvcvideo
modprobe uvcvideo trace=0xffffffff
yavta --capture=4 -F /dev/video0
dmesg > dmesg.log
And then inspect the log and the  frameXXX.bin files


Have you tried the camera with other apps like Google Meet/qv4l2?
Maybe cheese is being a bit stubborn?

Regards

On Tue, 17 Mar 2026 at 21:27, Dennis and Linda Willmott
<dennislindawillmott@gmail.com> wrote:
>
> I have a Dell Latitude 5550 running Ubuntu 24.04 LTS.  I am unable to get the internal webcam to work.   The webcam is not in the supported list at https://www.ideasonboard.org/uvc/
>
> The device id is 0bda:557b.   Attached to this email are the outputs from
> lsusb -d  0bda:557b -v > lsusb.log 2>lsusb.stderr
>
> To troubleshoot this, I did the following:
>
> sudo echo 0xffff > /sys/module/uvcvideo/parameters/trace
> Start cheese from a terminal.  The cheese window shows a camera with a slash through it.   See cheese.jpeg
> sudo echo 0 > /sys/module/uvcvideo/parameters/trace
> dmesg > dmesg.log
>
>


-- 
Ricardo Ribalda


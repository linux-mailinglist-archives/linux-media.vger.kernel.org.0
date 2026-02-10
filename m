Return-Path: <linux-media+bounces-52522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDZJDm5Ci2mfRwAAu9opvQ
	(envelope-from <linux-media+bounces-52522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:36:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4532A11BF3D
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 15:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F68F3009E1A
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 14:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC633803C5;
	Tue, 10 Feb 2026 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qrc1EuhY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B630319859
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 14:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770734183; cv=pass; b=cM0XGRXLfY52etxjgfgkQzFIHvjRkQXWx2Z+wmC558nsII5iZhTc+/NgnCXjx1ecgarCA0QIhmWP/kecUBvMnLF/yYAnHQ1TiBVTRfQNFfbyX6Rf/Ftz+tnxwgAn+tGJln1kZYKCWo0R2L1J0CR6wMLaDVfz56ab+T8TP4S3JBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770734183; c=relaxed/simple;
	bh=v3Ip3ZlCWVCbt1RK6JIXT7lYQyC0rAlnqYN6E3V39ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7PVRghe0vBEmePmTtVE52VWt9shLyOqJ8lqiTW/DXUWg4IYNrSeGZ2YUIrwddNGPmm7Vhgb9jobbuVGvYGYsZjTxbUPeNF41nhSlOKaIMgqr7RIIygHu65ElhPJ8OhZZdQ3VrtRPLPVV7CCOI9BvdoRwdHpHJkeFZbLFbvKTNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qrc1EuhY; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59ddf02b00aso6696557e87.0
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 06:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770734180; cv=none;
        d=google.com; s=arc-20240605;
        b=KHskixojVk+nyfUa/CEbsBL7Vz3clEidp+tLWR+/VMgMtoNnv3PNg+QmJPneA10SQg
         5PXf6fLxs6G1Q1IpTq6zWym3anNQqvzhD94fqm6yQ2cc+VTr6imOTtki8chiRfnwKCDi
         ZCZkacgHdw1SyvQAhFm2LlhfZpaXGct80iqMW9GYkNioFpmAk3jpWtuPdOzlKdESWGtp
         zGT99X15Om5hsbvvYDCFY4eFfV3yJ/firW9m7+m45ctPd1qs/C8pJmCO5ktPvHpK0FCm
         cNUC2phRaKsycbgewYdkknHI0nqXlOxn0vC/YD9nx1GP0Ra3/Cd3jkIfvPKpsTIjHlgs
         jzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YNfEzZiE1erjoASRSOldig/ywE8iCF1xrnMQ+RvTpUs=;
        fh=JKBUpwKcL2TgbL4MatytX+R8Ee1cDqidKkihphRR20w=;
        b=DiOUTob5g0/BWNruL1oydtcLWG9RTuaJq7jCHUfgnpHDtck0Sj50CHo22GdxeX8nkU
         nwI9bFMgv0zU8FUD9iMG342/Iui6SwNMYSGNTyM7vXNKmZxs+LZbFGUkIIz/AT8hWClN
         +PE8WvPzQLKr4N9cInuFjHc66oFxgbWgo/ivXzy3jUuCcsUQjy5JI+f6tT43DzOMwT4j
         G8Et2J+LFFEUUGqtdlKfk1eDk/6PmxYv+PlRAwyYWLiTGpCr/+hO7by+BJrvYTJS6wHu
         WFGbn5LKSO5Ygj7VkcsF+TDD1moavnynInt4hLOZ4bdIsoCo6TM8ESN1crcefMAPcZOu
         AD4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770734180; x=1771338980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNfEzZiE1erjoASRSOldig/ywE8iCF1xrnMQ+RvTpUs=;
        b=Qrc1EuhYwdcL6cGckFNvMwy+cu7QPyU0OGYL/tncjDDiTEa8bPfA4nD6H2QnnHZ4BQ
         Qf59OPfyBUDJUQ4flT+HKXvpniFCghG90m8XrCNRMao3BatvRkXCvo6JTCi7DFK75fmI
         LRjUUvjPs51s8OiD9PzAgJp4gL1EHbsyYq+R2AZnV6irzjl0wlVoISQuhA8TikkEGCOx
         E5GDwW6d/qfDGJ3dm/gyUJAdWKctInRZJERcMkMhMbeY5kS5NOhD763PZB7YZ5OOBlqt
         T3/cG4hIyuj2bxfMWTikytuHQL3xyaP8as0klw8K95TpJZ/UDASyaHf62+usO2vt0RZH
         qIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734180; x=1771338980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YNfEzZiE1erjoASRSOldig/ywE8iCF1xrnMQ+RvTpUs=;
        b=vn8GRt0bxh8KpTc8Ag28LqQDZsgG/x4S6Ug4B7ERVTPj0F0ogviugdh31uDtX9AX8m
         mmDGFFBikUH6Ce9tq7qTnDL4bF5GQ3A+7i52kCX7ljrFZrJhT9Hdt2neoz+paM/D8PKW
         qzpztIpwMIMm88OU66u4tjytnf8AKtpozfnL5QZYHULu2j1kBtLQBx32LJ82EdN8rFK2
         zZKWFzNao/rIESUeueZbAeAwVfVoB1W/n3WZeKFokdCVZ13sgqrKmGCSDkyPJFXTr0H0
         uEUBLSPFx+2TwhFPXB6Z0JWM1BNgqL05bLpAbIc9dqWRJrDuaGPombbWF4UffeB0OiaR
         0MFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp3SE1JFCzSbnJsPiLLsytoImGofqc6rkf/utYJe9nE8/DzYtWkDdAdkw+rpypBS/mlsflX7gs1VBAxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYX2p5PWJkPF12VYFWeRxKUbOF16rHCuVJoZDH/IrIqJvwCOaN
	pVP8QuP4yuLgO8L2uXSusLuhLBUJICmI4OhO+9raT14NAYvsnmJt+PSarbVkjSdk2TPBA1HS8kx
	ZYg9oWWfeO3oU2tcSfSrUKXdISseUAOwMromRopkfc8kO42r7ae2rTIU=
X-Gm-Gg: AZuq6aJXi8q4cCI2gPuGlzKK/7b1jtIzqu/tqSW3xZS5FRO8xqjeZSCMYrpgLTOHpRR
	QNabpylr4hUvPX+sH8cUsDHa1krfE8uPw67I60MqEKFHWAI+EsxPhqyzc0w7Dvi3TwS9IjvApLy
	ODiFAoRI/tkNj9rPojIC1h/1lTL25/S7Le1EuvOc8lRrkRb8QpI7FkbJDKxI//zcglmjpOMn0BT
	QoHsU6536opEnUn9nzxwLTAK+NK1uglnmGGZxHfco/INI3Tax1jXN/k5S4he6tmjZ7JisvbStKi
	n9fmdgAkvN7ZHfpEbFUuTQ6VhSiOMktAHfBqmodt
X-Received: by 2002:a05:6512:159c:b0:59e:3c74:82e8 with SMTP id
 2adb3069b0e04-59e45150eadmr5313993e87.31.1770734180073; Tue, 10 Feb 2026
 06:36:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104102048.79374-1-marco.crivellari@suse.com>
 <CAAofZF42TocsYR7kBMoUWC4YQMnqv4j37kWsnY9r75V5PC7UjQ@mail.gmail.com>
 <f8522806-fc3a-403c-93ad-f37638870643@collabora.com> <2b5e55c8-6790-4de5-912b-9ca23f6bd7a5@collabora.com>
In-Reply-To: <2b5e55c8-6790-4de5-912b-9ca23f6bd7a5@collabora.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 10 Feb 2026 15:36:08 +0100
X-Gm-Features: AZwV_Qhm-eFT9tMG9pcuct7VRQfyHLYP0MYN5jrnK5Leh4txEh3oseZw6-W5OAc
Message-ID: <CAAofZF7uLAd-tDnQq9joZm5vZunVr64QfF+ZFH-OoYfqG2OrCg@mail.gmail.com>
Subject: Re: [PATCH] media: synopsys: hdmirx: replace use of system_unbound_wq
 with system_dfl_wq
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	kernel@collabora.com, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Shreeya Patel <shreeya.patel@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52522-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,collabora.com,kernel.org,gmail.com,linutronix.de,suse.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marco.crivellari@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 4532A11BF3D
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 10:18=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
> Alright, looking further at the code, apparently there is nothing
> special RE the two unbound work queues. See some parts of kernel already
> moved to system_dfl. Would be great is this all was clarified in the
> commit message.
>
> Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Hi,

If you want I can send a new version with the improved commit log:

---

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq"=
)
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen, workqueue users must be converted to the better name=
d
new workqueues with no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

---

Let me know what's best.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer


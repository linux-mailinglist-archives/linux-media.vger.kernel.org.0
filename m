Return-Path: <linux-media+bounces-54027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DIiO0WypGl1pQUAu9opvQ
	(envelope-from <linux-media+bounces-54027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:40:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F51D1B71
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 22:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E212F3008D47
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 21:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681602E424F;
	Sun,  1 Mar 2026 21:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfAy1Poq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33B2D060B
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 21:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401216; cv=none; b=bvqxtk24HeuMmFuv8WeS61fWR2YvBLG3499Haq3+O03XvuxOVE5Vzo3ZuIQv9nious6mFvGte0ELNmEOIlkuv5EUQ0ooGyGDT5NqsqIQPopZlDwt4beyTNmHN++rofh8IbWN5sFeIvJch0HbIU/InFA2NKXEZfPEHLBSiGyZoXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401216; c=relaxed/simple;
	bh=Gf+LehvLqWwUWMmp08MsSGGSI5hV9/Ixf7T8p+f6+MI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gft5BMl2kVUOHE3w+P2lYR/tiKPuxNKY3TO1kT/M5HdWypIYCx7+S2G9QW/NQircp5c3YMyuQJKAuB9CvasSMBHcary9yEfu7ZPxWt5/R3njAqSd7y4NlkQbrti8kcGGVJdv/JQpuKYhQlqN41sqzgSrezrisGuB0MfzEi2lBzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfAy1Poq; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79863ab8478so36304157b3.3
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401215; x=1773006015; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gf+LehvLqWwUWMmp08MsSGGSI5hV9/Ixf7T8p+f6+MI=;
        b=ZfAy1PoqHJ+0Dqi8L1nUqSlMy2o1kI9fAGs34Gn+XsBidHm+T/nctL+4pKoqcaPaJR
         Npt8+H9wiya+vgMf79Njn0krgxn6hbX7Zc4nIbsf33jnoKGXUoKtdW0TpjqFcLTpBxe4
         ZZ15lNcoNKXCgpJgvB94FLQWfl8IAiulC+97+4BEekKW1Uz2qzWgjsKJ9cKwIyQ4rUM5
         kXep2l+gvvF3rdKhE79/HeWBBCBkRRs77k0BJGzjECi8xN1kz36vyCN6YOsddQwdYY2m
         qAtbr4kxUOdntdU8KTc6mqql3oEcnrDuBKaSsVaG8x+A2kkz+nFTrqWzf5aO2+11LVuG
         Dwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401215; x=1773006015;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf+LehvLqWwUWMmp08MsSGGSI5hV9/Ixf7T8p+f6+MI=;
        b=P8iVjCCwpP5jNTJFDPzR6JbbhEezps966YqHZuWHcwtKoLD9bGpK+NMsAVRWRA5Hbl
         GfqiXtgUrb43LWtjQ4nENiXlv9R13Fl9mcluTMj9beWzZVzFkeC+1t0Dyx49TAQN2lro
         G6oOobPg25fGHeBo7rNhO/R4UHZFJERhw3Xx35FHidZ4UYucbLdlgivOeZucGxsCTR8s
         F3t5UZ0bRtVUo29RZQQm7ZjUdINaWdFU5pewr9e8DRadT3kYpwaxV3YuWrra0L3Gw5Ew
         BXLSIMKTZtWCLDdezX7N+G2fH5puHL87UBR4rzYe3lfKbZ4yMvDvE7njs+m4kzCkTveM
         u2bg==
X-Forwarded-Encrypted: i=1; AJvYcCWN9jDanQ025/s3hTEQixG0Lw86C7z3TYfmYU4r6HtE0620dEOeV6ls5RtrHQP3vy6BgyRG8U/SemliMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD16cg7RQtkB+lHKD/2oM0FilvYIV+/zHMcQVpWsthme8TJ6G0
	dUDjz04jEImU9237RkTzFy+3rhfa0R+M8mQgDXvbPjh4oLYDdygs0NaK
X-Gm-Gg: ATEYQzxVmXmG7MrdmWvKuoFoWmCkfndErEZoHWvSHohlvMcGiH79U3n/F7Xf2Fkysuo
	aDKqQRdS1jtGSdqNoqIGC8tdpez4cIm24y8QrQjUSEWIjbcZtPA6ZsUTU63dSnJKbcW7BjJg5P4
	s7KuAzDiNshZO+9eM0E9Ohl43ha4Kh0aZ0RbuLZ1fg0O3K0zIgnl1dLgWvKv/fRzHJZ7MTcYXF2
	jYbt/bYBPOuIE8zbj28hVuOCsFS8CKv4s6zN4xVzL62a5P9dLPv5Owv7bbLPp+DoLs51Vz6ug50
	qLB2sOH6nENg1z0UJVHPABtUFBFNUhV4Sq4t6hlteBNRhmLgjya39hImF/Qn2vqnolIYOYxpe8R
	Xah5xrebXtahkmUh7+Kchxo4fE4ZZODNMlB4T0cLnC+nIrM2Epqx/YpsOmVqn+QzwSx2s+Nxfar
	Rk8XI0uWPyhJuZBi6vbDXL8oGJ6qYSM27Wl8PB6xzek6GnhIOtTX5/W5vjXRQhtqHeHwtGeI/re
	YKEP+ZF8jiG7l5I+hcOY+QrPdQ0KUgBYRjN0Bp8oGE=
X-Received: by 2002:a05:690c:ed5:b0:798:6af6:a413 with SMTP id 00721157ae682-798854695afmr95981047b3.12.1772401214866;
        Sun, 01 Mar 2026 13:40:14 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876ca7354sm43205827b3.52.2026.03.01.13.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 13:40:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 15:39:56 -0600
Message-Id: <DGRRSD969EY5.5S1OWWU2902T@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-media@vger.kernel.org>
Subject: Re: [PATCH] staging: atomisp: remove useless return statement in
 atomisp_cmd.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Oskar Ray-Frayssinet" <rayfraytech@gmail.com>, <hansg@kernel.org>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301212900.3783-1-rayfraytech@gmail.com>
In-Reply-To: <20260301212900.3783-1-rayfraytech@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54027-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A96F51D1B71
X-Rspamd-Action: no action

On Sun Mar 1, 2026 at 3:29 PM CST, Oskar Ray-Frayssinet wrote:
> Remove unnecessary return statement at the end of void function.
>
> Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET


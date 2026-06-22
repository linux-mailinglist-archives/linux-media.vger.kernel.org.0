Return-Path: <linux-media+bounces-65345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mqzDOZ8COWqGlQcAu9opvQ
	(envelope-from <linux-media+bounces-65345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:38:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC676AE4FA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:38:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WZPgwI6M;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65345-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65345-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41F4D316581C
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 09:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E466D39EF25;
	Mon, 22 Jun 2026 09:21:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4772439E194
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 09:21:32 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782120095; cv=pass; b=qJMmUSfRkweC8Mit26k0ikCL11KizLwQ/q1Z80HbinVWq/+1Rf2Gw8SxcNbc4IH4rIULQshvtLOdHafXWZ5jV+Bo3AjjXV/tf8NrQhnJUMiyZ8Fxdl0UETZQYxBv7YZHwoo6nXoB6L5EhSiAiyagVAZEvfAYqnvugn5cZEcMssY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782120095; c=relaxed/simple;
	bh=eYPr8fVVXfjzarQPeWY0zHO3httBH3NH7XBQncpY/F8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q8MyvzIWPak6QJvWSzQSrIL0Il8HDPNSA30sbc0QJCV5f9cRxAU3gkG4YvtOUqH1Q66J3VSQ2VQrSNrhMszxXX3yNrX9AMkqk6CaRl98s2hz+lzOC+3aXDn83CTMbqp79L+sjKGdLMmV2F1xuyfj97rY4ubnPQwF4CMQoV1O3sA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZPgwI6M; arc=pass smtp.client-ip=74.125.224.50
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6626b5ace23so5119552d50.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 02:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782120091; cv=none;
        d=google.com; s=arc-20240605;
        b=QRLh8hD5e3BEQPrF4eZ0ebmVx1Pi0U4C6ykAErCK4SwCqExTsGGV1h2PM7lGdJJhP6
         ODRzNYxcCW3FF0OCjDNyhuAJ+9p0LLwrqXt21eOtdlGkq8VPwEfzlgqWvN/cXod2konr
         up39r098kBvirgV1bQUAvL8/NfpOCm48O+CDVWHG0cwxLx6HwMZdo+OI4opWdoLXFwM2
         RE71ZhepZAqSEfMO0uFUiSUAbPk38236Kce6KD5ovMUCXAOt/UsfrhZYU5jwdzVivFFj
         Zz3OVvAPm7jkrXKEYBpHft9CY6ctF8uc6IXuEcUYgmAtOGEX07932DALwAq4uXlzxs/W
         gh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zioREeireMWCOfiX8Ey0JBTN3dwsWpkhqHeEu3w1Ro4=;
        fh=VEfZPHcal60X4ztxV/rfVyFL250AbyBBELc6jH+vstI=;
        b=KLomwDFrUjscBvuIifCjbEWuX6vC5wUohRxbk3Eg2SVwttQ3/gLgXhGMXHaEYhp9Oa
         29P8MgAfeltqbtx73c+Bngh1oPZo+pkemud6eP27vEW10BVhJPvQNuyIsTA1uiSfbrnB
         EuXpVzIbvG0HNtkI9HQe2wq9in2fZjjdxwrTJ55I4ayVnlY8fSRWu7hfcKLpuCV1m8ZP
         cqvxD1toMkhxZtb5levUh4U60bx9RP9qMmECnAefToK/zF5fcylkmT+P0HA5S+pm0O8+
         lx2DFQUH6WeGt7IFYUDJTZEFr2kVZLSPbcpyheyz5fgCpL8gj5lQ2d/qwONudolGTJkd
         vx3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782120091; x=1782724891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zioREeireMWCOfiX8Ey0JBTN3dwsWpkhqHeEu3w1Ro4=;
        b=WZPgwI6Mq5KfxFW5Tc8J9EjXr+KimabGH9vBborBYsyYQJqVBYjNd4JAJxVkp9uK1y
         1Tv14xHHj4sT4lOOBIrH9bpjvgR9dbwU4F8xPril1sNnieSdFrpky2l/u0J2XEZCCJdJ
         KQhWELFOOjvPfzYRx9aEL0QzCUL+bm3iSTEQuki5fBafaz7mQ6IhC4QHIRs64SMAO+5Y
         VIBrVuE7hKtS5TPaBpuSMsMXvj0UU4v8dUyABjghe4Duuze3y74vaveVcQYdM8GUhlVX
         MmpPDhpoG6iXKxG3agJUCmPvpRB82if4iQQTCR8Rrg5rNcMb2r5+L81CFqj7UbvlCJVT
         SREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782120091; x=1782724891;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zioREeireMWCOfiX8Ey0JBTN3dwsWpkhqHeEu3w1Ro4=;
        b=CzE+n/SqdOlZocFkMmAoaUmNHPNVM6sDc56otq3w2+T9JEHtZ7RXJ1JF3bZmzVa4lV
         tw9n+07EmO3b4XiWaoVMqjkwTh+ELXoSU6ZQ0tyw9E6E58flkS1148A6gSYhov+fUO+L
         1toY20FUV6pDBSsJwkUVkDaUkzYvNPTiv+algZ0d6zNGGlfa4bRiTP49urcqpq4RtEM7
         h8o+V6+RRjpJPL7D2jg2SmJNMROeKrxu6hQqgRqJy8sRGNiZCT5tukLyDy4fJN31TcIS
         CFHez/m08h9ZjrErZCK5bKFps1mdY6ctk9aydR0l5s+SbZQTK0l4AC+fH/dUUezb8Jbx
         iQGA==
X-Gm-Message-State: AOJu0YzWiw59xG8IM0o541G6YTGCVdSPEZ1/XyJD/xj/MXXrUBBWqLI1
	4sBFJw1tDDtTVM9g/jusRhoTabmWuXt0ox4sFmeVlYSNKSzydsuFU9hFLHngicavvUGhfJhsL76
	xk9OiMZc68WXTCKlJoxSgUaqd2rFRV+c=
X-Gm-Gg: AfdE7ckWMYye0zbZnJP+HqdIB1wIeNtuMs1dyAI9YNWbnwKf5/fMBjP6fNCLyjgcpMA
	Jb/8bQLX7JRUa7QU30AswEXU051MOplwdlOoAgxDDUkjtu/pE7+YpBjjSyZ5WKwr1UvnxaXcrot
	lXQFGWRTNoKSY7u+xTFgi2qZ07U309Sqd1mj70ZBtZvYXUBXVVoP9+JuySQf6hw/91kBOJ3poiO
	6yxCkPNo+nvbmyAupWtMS38ydiKtdc/7h+j5MNea9Qjz22prSvXbMc299q3t+Ab2ETQU0va9HU=
X-Received: by 2002:a05:690e:4092:b0:662:c0f6:77f5 with SMTP id
 956f58d0204a3-662ff15c88bmr9269557d50.25.1782120091066; Mon, 22 Jun 2026
 02:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ginger <ginger.jzllee@gmail.com>
Date: Mon, 22 Jun 2026 17:21:20 +0800
X-Gm-Features: AVVi8Ccis4_Q3ch0DO3LI-IAGctlhYnuG4JXw3UktIq7t60wTIqOQ0ik-erVIvo
Message-ID: <CAGp+u1aMp8PL0_OScboJ_DrTLa826uwQSgO1JKNK7Zj2GpGDHA@mail.gmail.com>
Subject: [bug report] Potential atomicity bug in drivers/media/platform/amphion/vpu_core.c,
 within vpu_request_core()
To: ming.qian@nxp.com
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65345-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ming.qian@nxp.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gingerjzllee@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC676AE4FA

Dear Linux kernel maintainers,

My research-based static analyzer found a potential atomicity bug
within the 'drivers/media/platform/amphion' subsystem, more specifically, in
'drivers/media/platform/amphion/vpu_core.c', where vpu_request_core() calls
vpu_core_find_proper_by_type(), which reads the vpu_core state without acquiring
the core->lock.

This potential issue is present as of git commit
eb3f4b7426cfd2b79d65b7d37155480b32259a11 of the mainline kernel.

T0:
vpu_request_core
    --> mutex_lock(&vpu->lock);
    --> vpu_core_find_proper_by_type()
          --> read and check c->state
               /* The checks are lockless */
T1: (for example)
vpu_core_resume
    --> mutex_lock(&core->lock);
    --> vpu_core_update_state(core); // writes core->state
    --> mutex_unlock(&core->lock);

The potential issue here is that for other accesses to core->state,
the corresponding
core->lock is held for both reads/writes. However, in vpu_request_core(), this
protection seems to be missing.

Best regards,
Ginger


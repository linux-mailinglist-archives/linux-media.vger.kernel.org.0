Return-Path: <linux-media+bounces-56753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBbVCq1twWnDTAQAu9opvQ
	(envelope-from <linux-media+bounces-56753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:43:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B59692F8AB1
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 17:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95D8731D242C
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B88B3B8BDE;
	Mon, 23 Mar 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b="pU/+tjGP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47D3BBA01
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281680; cv=none; b=dyxDtyS7bm9KcPdCofNxMux8zOXR1cEz7vuN2GLrmu5ScOs3X8Sza/fHni/XoqWGFZ0eudm9n2CpN8/cCx65DaJYXLcox+jNrJuLuJhBgPZKYw+Ddp9pIaNxrR83nRdJOIyF3L2Oi7IVJghufraFnGa6h7adRQohhATIkLkiEWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281680; c=relaxed/simple;
	bh=ZopYVyAeHlBFSz+/anofByoCYoLsO3v78kbbq2MzwYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvb1VM7CrmXAqvpOYDQKG4j0nwNf2pC2Vv9J+sCGkwcgBqlJKzqQOmfc+Ar+pNwS51+zXv5eFcJLjpL2ASjBuuFeBbaYBvc2BLQF4St8ahPhTpVoEu4YfzH8TS8QWRIn/vwE4oAe3UNMb1r13JE5Pj4TYMhz8tnJkB3+vrbkLq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org; spf=pass smtp.mailfrom=bitbyteword.org; dkim=pass (2048-bit key) header.d=bitbyteword.org header.i=@bitbyteword.org header.b=pU/+tjGP; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitbyteword.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitbyteword.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d556c1a79eso310873a34.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1774281678; x=1774886478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmhohN6RlSLZwmw7GnhmaqXlOUkxWsMUSbvXDFRlGSI=;
        b=pU/+tjGPC+ggbpYMDiWOMwETOyAKB8Sr8a92OBiViizy11szawSQLlypAkz33N4UxN
         wERdMGV0cqGAKzseKphcaq812WcchreqTidJnVj3t6a2hFsT+i1Lc/QHomUTCSixX/ph
         MPkIUwLJNQjiO3YaoapafweLs1LEUt7kU+8Ymtvsz4lfoG/D9ex4zo7feMyoSEnIJFNo
         xQtZlNye8y21J4J2TTGd8SR6EefqsLz6pkMVGFrei68f3cb6lGs2P9jjsO2r+FEEaWH0
         58BJIGsZsboHUegz4fiyyfeRiIfFsIfB1bz8QLYBgUFxOdbRhdRkdE9NkwiPXzo2QbL9
         O4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281678; x=1774886478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rmhohN6RlSLZwmw7GnhmaqXlOUkxWsMUSbvXDFRlGSI=;
        b=Xz4cHTEtpioonYhXINSrr2mOL+R6vO2wa14FWZtwkmBgVm0vhD8TvMl8f741jjXHTn
         ZPXrNthNzPtA7JY2iJVjhd+k0GUtxXM1d28y++EeNdvOtZ9vMOPWLc5x+O5NdY1ukjLu
         yRzOsYFetYbg09ck0sszJcHIn4favL++d9GFF1lvWRcSQfIlwGpOWTwA9dmSrptlTbLb
         YWDUZPJ4K1sIrcQEhUkyrZrAW5GCUvY97jA5/UJd3RmoDwT6JSmYKj68DvXw6jVx3+Xg
         jqOzOAfHbHl9/haDNt2L/uHVeSSUnx9S+a0B0HdvqEZ9/0M896nsBvCo/VP3s279cApx
         xGYA==
X-Forwarded-Encrypted: i=1; AJvYcCXZS/yFnKTSL6Akelb1iJKSWrzJEU8/VX567varjJZn3J1TZq9AHJELSs7GIJbhyXeNxUG7A2YVKYq5jw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq35U1yS1wr5dqfeTI8Je/DWyGOtBVJ3dwFWOtb4hjYFQJk7Jb
	EhxLhQaU62GI6W8GObil8mhS1wAqoy95pWHMc64Ru67Js+kn97vEr+fsSxaCwwbAs3o=
X-Gm-Gg: ATEYQzzYwn9vJaeZMzroUqeNWkcM0zmW3EGprrQBGzP7U1D7yy7CTRZszexhm9IMA0I
	4HZCA9Pa5CvbzwVZwVg3XwDQs8/o3VeGYNyJhHQkIto6GKHt92v7sERoUSWdKoipoY75VVjAA5G
	f7cTEgax87ns1nq3Gip8oVpiQ+lZhA4dt/2qLfQRDKSWl05Efx9M/pV0NMAEQg93ZbvS8hxBWkz
	JUn5kmNvPbz6bXvf2XTVohIZVfZmor1/cLnih+4HWamafVm+TKGsuDHudyDJEozevHGDq09iVYT
	sicYG7R0LJ1NikQTIN0Pa+O1/biJxDdqcQDGN3nRHhMNiKcDIz74N1GlP6oyB+kbiIpX7J293KZ
	hm0bU56e7cRFjjEvIXpAjbE+G0XIDMyCVdvsWPlFYEh0uzDV0+iV64xLg05Sbk2gF91WQFCeH3P
	bX+eZ66l7Xj2TQ+iHR5G1jL2n2ytMi2iGlKNCjSCmwqRTl72qTkHWVyu70Jch7Tazf1CuZ6n+ox
	orl
X-Received: by 2002:a05:6820:179b:b0:67d:6597:4d1f with SMTP id 006d021491bc7-67d65974f79mr5464593eaf.58.1774281678262;
        Mon, 23 Mar 2026 09:01:18 -0700 (PDT)
Received: from vinmini.lan (c-73-143-21-186.hsd1.vt.comcast.net. [73.143.21.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc9088df1sm843364185a.25.2026.03.23.09.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:01:17 -0700 (PDT)
From: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>
To: 
Cc: "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2 08/19] dma-buf: Use trace_call__##name() at guarded tracepoint call sites
Date: Mon, 23 Mar 2026 12:00:27 -0400
Message-ID: <20260323160052.17528-9-vineeth@bitbyteword.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323160052.17528-1-vineeth@bitbyteword.org>
References: <20260323160052.17528-1-vineeth@bitbyteword.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bitbyteword.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56753-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[bitbyteword.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vineeth@bitbyteword.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bitbyteword.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: B59692F8AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace trace_foo() with the new trace_call__foo() at sites already
guarded by trace_foo_enabled(), avoiding a redundant
static_branch_unlikely() re-evaluation inside the tracepoint.
trace_call__foo() calls the tracepoint callbacks directly without
utilizing the static branch again.

Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Vineeth Pillai (Google) <vineeth@bitbyteword.org>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/dma-buf/dma-fence.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 35afcfcac5910..232e92196da43 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -535,7 +535,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 
 	if (trace_dma_fence_wait_start_enabled()) {
 		rcu_read_lock();
-		trace_dma_fence_wait_start(fence);
+		trace_call__dma_fence_wait_start(fence);
 		rcu_read_unlock();
 	}
 	if (fence->ops->wait)
@@ -544,7 +544,7 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
 		ret = dma_fence_default_wait(fence, intr, timeout);
 	if (trace_dma_fence_wait_end_enabled()) {
 		rcu_read_lock();
-		trace_dma_fence_wait_end(fence);
+		trace_call__dma_fence_wait_end(fence);
 		rcu_read_unlock();
 	}
 	return ret;
-- 
2.53.0



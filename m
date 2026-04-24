Return-Path: <linux-media+bounces-59477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JwlM5IE62m2HQAAu9opvQ
	(envelope-from <linux-media+bounces-59477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:50:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC53B45A0F8
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E0163007209
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 05:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42776346E6D;
	Fri, 24 Apr 2026 05:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qr3x8mBC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A3318B9D
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009722; cv=none; b=Kzr5z250zEH3/6OhqlU6BHcX4VJR66ehNLdvzzs2vdW2PrEKjCIvE39kD1Qz9qDpZQki1X8JLWKy4OQ7FnBC06b547d/FfbSLoUDXyqDwJJ7Wjydl7KifwvEKrfF7i2pEx3USo4Ty9rURKzx86k2xaHuNVUIzgd4gDi1m90L8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009722; c=relaxed/simple;
	bh=g4L7C9uN0rpytwf/MlwodVI8K8mAxgIk4T8HtuH8eBk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6ca1G+FtAr3+0A1BSsoCu1hlRj1bwZmoK1ekG5yhbUBPPVh8tGWCaEhwfS3tEIBzfDY2kUZA4nGChaEEYTxuLk3UIyIjx2mvD2vDLCxUAt5ctXIJWqbhqB3aPmayHlfumfM2WVpj637Fta7O4dmvZVjtcodcyk9b2g1NJOuFcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qr3x8mBC; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c795a47186bso3169819a12.0
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2026 22:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009721; x=1777614521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUmefGJqV+IRkFPz6sSuv3GYeINth0c7dueYg2gp07o=;
        b=qr3x8mBChy13xrFs2CI618m0GGybqCQ3y7V2uDKDhW2FCCRvwFLoXceP1AG3dxHjg0
         aYhokGCtCuYCWMYFQq8kwi+KBz/Pkl68vQFAGrOFh77BC3Q94wCtMLEunggzxc7DoWtj
         Jy1up0zPtxiZySk2DzkoDJioXsry/7RjDbcARoRBFQae9HCkkcUKw3LicjvyD/T+iN2u
         8vXt4ibmP2Ej9GQg0p77h26T39Rvmlsyw7vsz/b2ywyeIueiq7KXnqjep6HyJPlG24BW
         3cozFqVWo0eNSkiSW5DGXjEdI0ooT3eTkYpulHn563zc5lrAKml8wmLWr8eelzj5i+db
         MlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009721; x=1777614521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUmefGJqV+IRkFPz6sSuv3GYeINth0c7dueYg2gp07o=;
        b=R0IAJgxEp71Bm6VV0A7sGcpEDvlvM6kBYzRRXBs6jtQdKhxcsBugz2PCyqLdt6551K
         ugXC9LQSjZvHYRwwWI4W6tqX9oOOBfmGsCcK1rVuMdPgDi//qFRrcph0h/OpE2jGEN7Y
         w/3mlydk81QaR7+XT5zBC//qvhVMyR6aA6Id1QRcBUxTVqgA/nbX6rfiE6XQ4NqC36lh
         a28KCQczEaPT5H8GuV4v+OVHbskkWJuCyPoL8bMskqlTBZAOLTCNhzMY4ytZeSE5q/Ie
         4B41IXIN+AcE37EeGcG548pZhJVJUzKN6DmhXluqYt9X0RpItFJ3ayKMSn9qe3Zx7OUP
         P+4g==
X-Forwarded-Encrypted: i=1; AFNElJ9apKFWQEkSJMaO8sKzLCOSaDKxipvi0Mhsawy69DFqOJXsckIIhwy1Nc7bWNNDtwyhXj3ssEf2QbR73w==@vger.kernel.org
X-Gm-Message-State: AOJu0YztFk1kobembrFGYhCp2LWkU3+VW+YRRWWLjyV+/Bm4yPGC7VdA
	qiTfADoxNwdVbp2S0gE0IRB2nsnkzCdkCbdCoNoHWjeykbCRrsq1dxj7
X-Gm-Gg: AeBDievD62TbVDvjSjl3+uHD4Z8+300xPBFb2g5tr31PWXXp1NQSY75srOjDDQMIw8D
	36WTAftK8CyzVHXyOCFa1h7KWIzFm3mB2zcjr/oDnyx62BEOjN4CRl8aO4nMoD07syY3KLW69rp
	LjwmLMc8fR47UoQ9oQfyCthxK/RBX9xW8WzkEgtoQyIWerpHyOR2w1Sb0TJbQPk5rDmz8176MG1
	I63oLFpVhd5ziyq61LWY6Dmwal6faZfIgbpU3jXCsbsMtvnRPK0QwcAjVKVrnIqiUnNFDL15l8x
	lbFkxxA3q2WFWC9ZqEKYGSiBh6Tv2WIoUmKHfYkDbZJN6ikXQNXzaBbtODNsiemiN+HVj15vWWJ
	ty6E6gwexBdjQsItySpS8oCCDmcSgBa7rF/37SCPneJ30xTSsIe7QFaW3DcdUoOHPV/vTaoKapD
	RgcGHy8THVq5bA74BiFzOcZdqBM/bKxCl7atz3SfG1bgpyc7CTqFuLKFgji3euoP41/Ifdc0t3L
	Xm2D60+UE11GQA=
X-Received: by 2002:a17:902:b195:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b5f9eb272fmr183181305ad.20.1777009720961;
        Thu, 23 Apr 2026 22:48:40 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:40 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 4/7] rust/powerpc: Set min rustc version for powerpc
Date: Fri, 24 Apr 2026 11:17:39 +0530
Message-ID: <20260424054742.45832-5-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CC53B45A0F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59477-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,infradead.org,akamai.com,google.com,goodmis.org,linaro.org,amd.com,garyguo.net,protonmail.com,umich.edu,arndb.de,ffwll.ch,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Minimum `rustc` version required for powerpc is 1.95 as some critical
features required for compiling rust code for kernel is not there.

For e.g. Stable inline asm support which got merged in 1.95.

Link: https://github.com/rust-lang/rust/pull/147996
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 scripts/min-tool-version.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index b96ec2d379b6..406895621511 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,11 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.85.0
+	if [ "$ARCH" = powerpc ]; then
+		echo 1.95.0
+	else
+		echo 1.85.0
+	fi
 	;;
 bindgen)
 	echo 0.71.1
-- 
2.53.0



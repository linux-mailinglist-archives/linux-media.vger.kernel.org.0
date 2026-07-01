Return-Path: <linux-media+bounces-66275-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gaQ7DQRpRWoJ/goAu9opvQ
	(envelope-from <linux-media+bounces-66275-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 21:22:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC46F0D08
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 21:22:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mbX1VhFf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66275-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66275-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8BA5030254AE
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 19:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B3A4963D3;
	Wed,  1 Jul 2026 19:22:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D682D397E64
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 19:22:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933756; cv=none; b=h+nui2pxmJZbFs66S16QYUuiAAs9vVpdSaEnYTiTHFPSfRWntMK07w4v7yIYPJUkAksoXlLR0Na4ec/JIGcuRzQVL0DPK4DR8SozqIRwQ10E3Mw9uGOPYV7wKrSO8CAaDSZU3ppH7g/wa+TInkK7Xtn7F6WtTw8GH8VYh8xsoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933756; c=relaxed/simple;
	bh=bFvXqKJWkf5BMGbp45KpathPgCWSGtKn5GiWUSs9TkM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GUhDaI6SbuqJWPfiLo/U+OCerIxafypJHuatOusQcCc2sSzsgK+lwbfv5N8Bqm8jXQuAwZIDqkDXjzLQqUDOf0kHosNuSl5BhIO95YFuOLn8Y6WD5VfDePfthvWxYowRX2AEI5pJPP6tlTcaMi3ObkgCw7nHX8S6c2RPLb2tBAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbX1VhFf; arc=none smtp.client-ip=209.85.161.51
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a0ddedcd00so407590eaf.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782933753; x=1783538553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTaa1f3vcFQz1JXAdbVo3mJ6YMjKrRzWYP+nH66vQBE=;
        b=mbX1VhFftg63RZBd3S1VodtO42JV89ky+dSTtXaoKBHcySBnfxRajHZDEOcGMGRckS
         SDP/HfudeCDc3VxJ0+NIWXQrkrmbc8tiFP4vdlG/ixBin6FqAw9Mk8F1lrMIUFrvCQ7d
         kCGlfNmQrpUpEweNTt3AsQ3hiY9dnrf7eC/7thxZPzvO9uYBYxw66YXZkg6I3szsTY6b
         Pg8ZZE3lyO/QgEZNeVkQbTlQh7JXjwH8Ac8MqEN1DMJWd1NHQTM3UL/07ibHcLsrMyAv
         Z79gS/irVJCGdnzMBDszR57DdPHwHo0qLMkFOPxDWnGOVbmg4EXKFFpCtBdOR0fljzUI
         Azfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782933753; x=1783538553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTaa1f3vcFQz1JXAdbVo3mJ6YMjKrRzWYP+nH66vQBE=;
        b=swbNcioLxIzfA7HyncDlFHIe9Et9ApeXxpZaOj1jSNwpZ8JmpW022z4PSzg7qlTPPf
         q/fAmOMebXnkC4LuQkNok81LRfxfzfvK7P7GOTtIaz7siu45La/1wkH2mGfa0vOE9LV6
         DMdMJ9xzK5waRPdhbL7fyLEJDv9nWFaHuserl1F/c57m9cXNc2PLk0XaZ88vUu/gy9lP
         XE+yYOOzfwerfXIY3XIUiu+bfXYxjT1LQOgz9xd68xsH05avJ6UNY4ZESP/aZv7WT7Hc
         VG4orGoPDgnq9/Krm3d8LaSc+567Fue9bEOpId431uhdxlG7Ep1SuLo1TaeH2xOk1IID
         beLw==
X-Forwarded-Encrypted: i=1; AFNElJ+wPXZGIwnMrZ9g1D+gpJt/+9nQPlkFLRRAZeaQMdRCvb4i/hJzbnnJh2wXOmkMkMjUYKK4v91bc4eyBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvBOq8SeeCU+kBm4vX+4ox0W32o32IhmZPWqNs4Rfe9yqqzETA
	OKaT2wNXPen9yAiqqFbhprXjctebFX66xHipP7ziKeHo8FNnvxaJ9rE1
X-Gm-Gg: AfdE7ckQT5XRQWVbDTvfan7IEh4xLPoBf9EMHrpana0io1HuqLHgJAoV5XL2qDho3Xy
	omykr2CgkTYYAACx/q5kv7WIxBpp2ymn2eK45GVKp6rekp20eYuJVWmla8G6qdEKDPXqk7HiEZt
	2NIx2kuwJ8t8RwsDeUpWIfMMWIi1Tr2qANWM2yrNV3cX4lXhnqjzhN7sefEa7C/AA9HsKF50ug3
	08hI7s+AGvDei/Yf17Aangj2ImXXZ2gIf/90xYCsDGvWs4+2OhDK+eDJkwFSH9t/7oCGDAhjfcU
	pdl4I2pRoyNZ82WqFoYKCMVRQDhVXoySyExa7UrvINNJHz7Ph+0CXwQztpgXRF343iMQvvGOEQ6
	DwGkbAiQdU4ywYT+adVgRwoCptlCaOqGqN4VA/SMkpYgeZlg7uUi2DuBg1fmjEB1nJdc9yKAGPk
	WZwVj1GpOFH2TUX/mLtgI=
X-Received: by 2002:a4a:e904:0:b0:6a1:50e7:5c1c with SMTP id 006d021491bc7-6a309be5591mr1545058eaf.71.1782933752754;
        Wed, 01 Jul 2026 12:22:32 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4d::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a3103cddefsm608995eaf.13.2026.07.01.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:22:32 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v4 0/3] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Wed, 01 Jul 2026 12:22:23 -0700
Message-Id: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPBoRWoC/23PQWrDMBCF4auIWXuCNBNLxKveo3QhK+NEEMtBE
 iIl+O4F04UJXj/4Hv8biuQoBQb1hiwtlrgkGNS5UxDuPt0E4xUGBaTJaqsJa3heZ3z4fBNMcWk
 Fe9sTe/ZGOwedgmeWKb428xuSVEzyqvDTKbjHUpf8u501s+3/Lh+4zaDGiZ0/+2Ad2fA1S/Wns
 Mwb1mgHGHMEEGoUoXEyvbie+APgPXBU1hg1eh7thcXZKYw7YF3XP7v7NSI9AQAA
X-Change-ID: 20260602-tcpdm-large-niovs-56523a3a1077
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 sdf@fomichev.me, razor@blackwall.org, daniel@iogearbox.net, 
 almasrymina@google.com, matttbe@kernel.org, skhawaja@google.com, 
 dw@davidwei.uk, Joe Damato <joe@dama.to>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:joe@dama.to,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66275-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devmem_lib.py:url,meta.com:mid,meta.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9DC46F0D08

Every devmem dmabuf binding hands the page_pool PAGE_SIZE niovs today.
On NICs that consume one descriptor per netmem, this caps a single RX
descriptor at PAGE_SIZE and burns CPU on buffer churn.

In this series, we add a bind-time netlink attribute,
NETDEV_A_DMABUF_RX_BUF_SIZE, that lets userspace request a larger niov size
(power of two >= PAGE_SIZE). Drivers must opt in via
queue_mgmt_ops.QCFG_RX_PAGE_SIZE.

Selftests use udmabuf, but udmabuf sgtables were previously hardcoded to
PAGE_SIZE. This series modifies udmabuf to respect folio sizes in its exported
sgtable. The result is that when backing udmabuf with MFD_HUGETLB 2MB pages,
the sgtable is populated with 2MB entries, allowing devmem's gen_pool to carve
out large (eg. 64K) niovs.

Measurements
------------

Setup: kperf devmem RX/TX cuda, 4 flows, 64 MB messages, 60s, dctcp,
num-rx-queues=4, dmabuf-rx/tx-size-mb=2048, 10 runs per niov size,
mlx5.

   niov       RX dev Gbps   RX flow avg Gbps         app sys %
  -----  ----------------  -----------------  ----------------
     4K  300.63 +/- 53.21    75.16 +/- 13.30   54.15 +/- 10.23
    16K  321.35 +/- 28.20    80.34 +/-  7.05   41.05 +/-  8.87
    32K  347.63 +/-  2.20    86.91 +/-  0.55   44.54 +/-  3.51
    64K  332.11 +/- 14.26    83.03 +/-  3.56   35.47 +/-  3.11

RX app sys % drops ~19% from 4K to 64K.

kperf support (not yet merged):
https://github.com/facebookexperimental/kperf/commit/8837577f920876bce6986ec18869ac04439ebcd2

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v4:
- ncdevmem: fix the possible overflow in ncdevmem (Sashiko)
- drop the udmabuf patch because the fix is now already in net-next
- silenced two pylint complaints in devmem_lib.py
- Link to v3: https://lore.kernel.org/r/20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com

Changes in v3:
- fix a bunch of non-reverse christmas tree declarations (Stan)
- remove extra uint32 cast for getpagesize() (Stan)
- remove overzealous strtoul checking (Stan)
- remove value checks that the kernel already performs on rx_buf_size
  (Stan)
- Link to v2: https://lore.kernel.org/r/20260611-tcpdm-large-niovs-v2-0-ee2bf15e7523@meta.com

Changes in v2:
- Use NL_SET_ERR_MSG_FMT for sg alignment failure details (Stan)
- Keep -E2BIG (not a direct ask, but seemed preferred, Stan)
- Update udmabuf commit message and comments explaining why
  "one sg ent per folio" is useful (Christian)
- Set/restore nr_hugepages in py harness (Stan)
- Link to v1: https://lore.kernel.org/r/20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com

---
Bobby Eshleman (3):
      net: devmem: allow rx-buf-size > PAGE_SIZE per dmabuf binding
      selftests/net: ncdevmem: add -b option to set rx-buf-size on bind
      selftests/net: devmem.py: add check_rx_large_niov

 Documentation/netlink/specs/netdev.yaml            |  8 +++
 include/uapi/linux/netdev.h                        |  1 +
 net/core/devmem.c                                  | 55 +++++++++++---------
 net/core/devmem.h                                  | 13 +++--
 net/core/netdev-genl-gen.c                         |  5 +-
 net/core/netdev-genl.c                             | 19 ++++++-
 tools/include/uapi/linux/netdev.h                  |  1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 ++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 36 +++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 11 files changed, 180 insertions(+), 40 deletions(-)
---
base-commit: 805185b7c7a1069e407b6f7b3bc98e44d415f484
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>



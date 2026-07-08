Return-Path: <linux-media+bounces-67078-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WglUDGnVTmpHVAIAu9opvQ
	(envelope-from <linux-media+bounces-67078-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:55:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A972AFCF
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:55:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DMSkVpcO;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67078-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67078-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C54DE3041BF2
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 22:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD867397E9D;
	Wed,  8 Jul 2026 22:55:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C981D385D97
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 22:55:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551316; cv=none; b=INN0RJ46y1GduI4BQj4PGjwCm3lX6gTBtPUWXVDQmPlb0z99MXgkM+KWnmEMYbP4MqVd8hyaPPGu4UthdwTawOM4ymrdmdvoMN1EIbHV06zQ46BzhfkAThsSRrrOEU8t2SR9QzBV07FhrkW8IKmBRgHZUy8R1t1Qunn81oymBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551316; c=relaxed/simple;
	bh=Avs+3PHRJZ6m7C0sYcesQHDLZVIwPPV3fD56A6qoBV0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TZJMTmN5O8tjO7SuEF7zzBrul/P7XlHP/vLDM52YjvW+YpLa7XZ1OknOc+KUyHFcjuVSoB6LVzunpdGmfstf/XYDQ6tV4xSMawFu+9znDTjoC7eVE0UzY6su2gSCfu+4gFvaKi6VYQ0VGekuJAozaS6jC6Jq2ABvRcBvF6b+MRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMSkVpcO; arc=none smtp.client-ip=209.85.210.54
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9fa42f08cso909058a34.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 15:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783551314; x=1784156114; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EzUjmP9XIEW9/Nh3Po0jQynHplRQUkqS1YMrmb8xU7M=;
        b=DMSkVpcO1P21BtGJUuf94UGxJBpptvPcQk/GQsj8JgB/eM02gTBuzTFUV6G1Yb2BAL
         t4z5bbsuMID2JERumDg2B8wpnxxRG86v2sz3ZmIeFz8WjHEiTXvLZ98JJ950fKgTRNrd
         oIlRSw5rd4BSTfuNLLPnj57oXqZFgLxaNYBpAzNwhintn47GxFnll1jcjvBL3lT5Sr8e
         zOvHPXNf62g3PDQwxLtvEwGtFvWtaSRDHp2d51zDOltAre982U+RmINm1YNEVNV02cs6
         EbaeKLJsabc+6NNvvLn3V9pnQBf85WY63C3rZML2uW3o78f7EdvRzy9MX2/VMRvimd7L
         wB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551314; x=1784156114;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EzUjmP9XIEW9/Nh3Po0jQynHplRQUkqS1YMrmb8xU7M=;
        b=pS0KyZCNyagYB1BZUlc+wKjTPyMab+dweejgPXGkX21I9uBzLRqOqFaLFyKSeazDLS
         Kqctd/Opl3lqVE2dxzWfFNqQ3z5+ILxzMmiomK12B8UZqTzqWiYYPbwTCNIvuh83RWXv
         WwpEcgwN0sQBciu0hI+f+qg0SHMrjOaFoXVSV9RIFkfY9tg2AJPjDxqAJ5eFLSUE3BW2
         DjyCB/NXJqkFFYZ0pF1rz34KK8E3u/yjECLCPR7TUh8Cv+/kx1Uz2RYllW+M+NzwnfVH
         Xv5jbRtCQt+8coBe64gRjXuwj6kaCYFKEdTKwQTlxJX0BcXCu9b/L0Md6Vp1fy9mvCke
         CIsw==
X-Forwarded-Encrypted: i=1; AFNElJ9tSEmWely3tIKmOx5OaygsacSpdiolCvw5dHRyE39h1fcGHEVB4dVl/utMG4PN5Zh/Xm4MUsc/CZ5LJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3G8sH//Isluh4UKQo2qAj4ZaKbaVa6NRBtYNVX+EMVdEWRYAj
	l8qDqJpN8q92A7/sHBCQXx0/29zpFtpP2ySNp7LiAYQpfvXhadHrpLCW
X-Gm-Gg: AfdE7ckUCrzAfHe/3YBrUXEfP3cDTQX2EEuqzz95rLfiQCR1oXD85I7ge4BrAPNcaFb
	Zbi2JHvtNerBtHyjLF2v4K0mNJSRTRz1r25oEeoWukbqseUtYJPiyMOFXY7hkCBMd7Nm5bkwoch
	i/Jc2zFeyRi6dcRn9iRO3y1L9BICxm9zMJYsh64Vss4ySGjw/tvsS8yCFEypBPK1skYH3kAMbTL
	tjTvehyeVIspGPSmYDxah47HcdxQLxxChvsakkRBrRDsENZcrSWLqAORUfZ3y1JbdlvJYMhG8bF
	1eF6C+UeJXPOHa7ble2uk1lg2/jeJ5UJhZ08niCHLgmxpmXmxfbcjy8bBvI66mMzQNGeYtd8eVi
	jDGxpoK0nXCc5KZM6IsPc9iXLusxoj8lQs5zatj68U4RV3msvP5kwulpPeZn197VISILdoXZUf0
	dIYCHuwLo=
X-Received: by 2002:a05:6820:80cb:b0:6a3:89f:62b1 with SMTP id 006d021491bc7-6a36d9c95cfmr3040744eaf.31.1783551313607;
        Wed, 08 Jul 2026 15:55:13 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a83eb2dsm2784367eaf.10.2026.07.08.15.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:55:12 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net-next v5 0/3] net: devmem: allow rx-buf-size > PAGE_SIZE
 per binding
Date: Wed, 08 Jul 2026 15:55:03 -0700
Message-Id: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjVTmoC/23PzWrDMBAE4FcRe/aW1T/1qe9RepCVVSKo7SAJk
 RL87gVTqAk+D3wz84TKJXOFUTyhcM81rwuMwg4C4i0sV8Z8gVGAIuXIkcIW75cZv0O5Mi557RW
 ts0oHHSR5D4OAe+GUH7v5CQs3XPjR4GsQcMu1reVnL+tyz/9cfeJ2iYRJ+2BCdF65+DFzC29xn
 XesqwMg5RmgkJBZTUla9lbpF0AfgbNnXSNh0JN71+xditMLYP4BT6cLDBLGYJw1SXvr6QBs2/Y
 L/1iW2n4BAAA=
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67078-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:joe@dama.to,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 941A972AFCF

Every devmem dmabuf binding hands the page_pool PAGE_SIZE niovs today.
On NICs that consume one descriptor per netmem, this caps a single RX
descriptor at PAGE_SIZE and burns CPU on buffer churn.

In this series, we add a bind-time netlink attribute,
NETDEV_A_DMABUF_RX_BUF_SIZE, that lets userspace request a larger niov
size (power of two >= PAGE_SIZE). Drivers must opt in via
queue_mgmt_ops.QCFG_RX_PAGE_SIZE.

Measurements:

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
Changes in v5:
- removed unnecessary change from ssize_t to size_t (Mina)
- removed '--------' lines in the commit message (Paolo)
- removed commit msg about CONFIG_HUGETLB since that change was already
  merged
- Link to v4: https://lore.kernel.org/r/20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com

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
 net/core/devmem.c                                  | 51 +++++++++++--------
 net/core/devmem.h                                  | 13 +++--
 net/core/netdev-genl-gen.c                         |  5 +-
 net/core/netdev-genl.c                             | 19 ++++++-
 tools/include/uapi/linux/netdev.h                  |  1 +
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 ++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
 tools/testing/selftests/drivers/net/hw/ncdevmem.c  | 36 +++++++++++--
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 11 files changed, 178 insertions(+), 38 deletions(-)
---
base-commit: 474cff6868129755cf889edf40d7f491729fc588
change-id: 20260602-tcpdm-large-niovs-56523a3a1077

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>



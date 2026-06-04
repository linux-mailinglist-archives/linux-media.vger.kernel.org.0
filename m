Return-Path: <linux-media+bounces-63709-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VplTIqvLIGr87wAAu9opvQ
	(envelope-from <linux-media+bounces-63709-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:49:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B6463C1CD
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:49:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pmFIruSV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63709-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63709-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7933730AE16D
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA962236F7;
	Thu,  4 Jun 2026 00:43:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055023507C
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:43:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533798; cv=none; b=fgouqmUUTimHdKTjrMpp0BKXWjBBMGs4x3CncobyK6G6ZW6cGb4mG9vF9f+SgM/tDZqaNZaXiCw9NZ+PdaJxqfA1haqjq6n6V+uAbb7QgPlyB/uHVzRe6CBhMtZZu5mcF9sLv89S0L27/GG78AictiGshhFgkEVNUoPE8Y4kZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533798; c=relaxed/simple;
	bh=z413rEVyMB6mH/jde6zuXpETKXPhggQOWfBnPF3Jd7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaNjcDn5nosj9DKBak+ZucVAwRoBZX3iL3EE5vFuXf/kkOYjg3eUWp5hfeq5pRS9D251iVCHexdoHygzMaPJfGS9ENiHeW3NGEQ8405Pzac2yWGfGAV1XYuDFgEosq8deOioHeRf/VIcOStLzY8NFPBE0Gx1yi+q3xNU09Gg5Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmFIruSV; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bf36a6905cso855815ad.3
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533790; x=1781138590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFwU+gJPCdIvaG8BIeMjrGJqao3C2Cvmdt82URI9gpQ=;
        b=pmFIruSVaXb1eqrli29ftEkZpNcoxQ1fJRkKQz5Y+T2MjTTDwzikrjYY1o806t4bC4
         vTWRbrJCpmhe7iLHalhz/2Uwfmxz/CandvnRuqwoYL9LQhYkoQnAxSUEtACzpV7e49m9
         9fG+Pti+0GLtB2HLWRoO13ctFUHlF5EOOJam1r4Ly35pIQsCmn6SjycNhq/D1h28Drcv
         dCwQlq6UORY2CfE3rwN5XFthoqqQxrjfH889qAbenqSQMkdJZQZyNYH7niCQiW67G05Z
         UDzvNjXE2eqcYsi84tBP2uGZBz1PtlLnzMenxiJvU9SxEg9VmQrwjcZgdc8Xrg3WcQG9
         PobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533790; x=1781138590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yFwU+gJPCdIvaG8BIeMjrGJqao3C2Cvmdt82URI9gpQ=;
        b=Khf+L1ENuEtOy/YxJ6wTSHlR0uj29c4cyeA1Dvz7IMEpvgemB5E09vpluwWjvdaMoO
         gg4CXh0P0Pb8iljpk7ROZV4IVO1LPGPsFbdXcXL/Lqebn/2uiC3U2BCVaFiiuY9l/fX2
         3pwEIbGzby0bFYO2r5NbuK7yW+FkXLkZ1PDBqDpM++SC7K6fJKJ89NusRYYzzDPMoG8M
         l7EEZJ9txN9Gq6890Cj3pmrY7r2iCdcHVeelMiCmaCYsVh9WoKFASu9UV74qJBa6/gPK
         lgTrERTsDOTWphxUsAbrvTanykysy6I+G60lBW5I5UryJxFHtqyodQ4FOF3iqy2v9JX3
         HyNg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ojch5EMxBVYr+2iyGoCZafbXiDWEZi7QJdUKxcuQwbULQYfV87jg6iLlDZ9KB1Y0K8WjCAOuN7lVMuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqlLnEqr2BawSoF6c5pAPflxbU1fQJktDgMS1mow++txghN2x
	px0ArwWCdm7V0RaxMUpaAOCeXc9biJjqasPyWxNMV0TGOBCClPvJCi2v
X-Gm-Gg: Acq92OFlH8uAuoH3kMm1s9fFXCkv11GcgpF/d/VIneCQrE5c66CnN+mZTyCCY5Iyyvx
	84aGJEj8yGYTa/7/pymmUEUct4v/jPL9X2fhn1oh4U/Fq2JSuja7e3Y3kfhAQiGDtgcNKOkQz71
	DAzs+6mBh7repY4eg+SRkRPtUvWRuXyLaJKccr6SRYZuNt1cx1EsdSkOplhJYYcI95C3PsdrgF4
	dgVySYgvOEqG0RGORpeJHRlvTwKMegl4fQSNqyZ/hyoNz5JON264R7+J7pGGDbr9NFC9Dh/rP+J
	WFbhMaxtKklPA7tP68zjpwELVfJ+0aejT9CC4qUzDC5e2+ONkiM8Pgkzyol6aEON/mb/QcSLDnf
	6F5LukyBJrMCMC6C2XL5Xy+auhUzDb14h3yWt5dx1z7/UWGsPf1ZeEvoK6YcpwbocBft+sbujYP
	HPxsFWIgdhF/VXtgHJOagui2H0Wo9LTA==
X-Received: by 2002:a17:903:3b85:b0:2c1:8fea:4dbf with SMTP id d9443c01a7336-2c18fea4df8mr24927635ad.8.1780533790154;
        Wed, 03 Jun 2026 17:43:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:73::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e1b6sm37277735ad.38.2026.06.03.17.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:43:09 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 03 Jun 2026 17:43:01 -0700
Subject: [PATCH net-next 4/4] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-tcpdm-large-niovs-v1-4-f37a4ac6726c@meta.com>
References: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
In-Reply-To: <20260603-tcpdm-large-niovs-v1-0-f37a4ac6726c@meta.com>
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
 dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:donald.hunter@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:pabeni@redhat.com,m:horms@kernel.org,m:andrew+netdev@lunn.ch,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:shuah@kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kselftest@vger.kernel.org,m:sdf@fomichev.me,m:razor@blackwall.org,m:daniel@iogearbox.net,m:almasrymina@google.com,m:matttbe@kernel.org,m:skhawaja@google.com,m:dw@davidwei.uk,m:bobbyeshleman@meta.com,m:donaldhunter@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bobbyeshleman@gmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,intel.com,linaro.org,amd.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-63709-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lib.py:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:mid,meta.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29B6463C1CD

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a new devmem test case for binding the dmabuf with rx-buf-size=16K.
The test sweeps RX payload sizes straddling the niov boundary to cover
the sub-niov, exact-niov, and multi-niov RX paths.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 +++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 46 +++++++++++++++++++++-
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++++-
 3 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/devmem.py b/tools/testing/selftests/drivers/net/hw/devmem.py
index 031cf9905f65..47b54e18e7a6 100755
--- a/tools/testing/selftests/drivers/net/hw/devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem.py
@@ -2,7 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 from os import path
-from devmem_lib import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+from devmem_lib import (setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds,
+                        run_rx_large_niov)
 from lib.py import ksft_run, ksft_exit, ksft_disruptive
 from lib.py import NetDrvEpEnv
 
@@ -30,11 +31,18 @@ def check_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+@ksft_disruptive
+def check_rx_large_niov(cfg) -> None:
+    """Run the devmem RX test with rx-buf-size = 16 KiB."""
+    run_rx_large_niov(cfg)
+
+
 def main() -> None:
     """Run the devmem test cases."""
     with NetDrvEpEnv(__file__) as cfg:
         setup_test(cfg, path.abspath(path.dirname(__file__) + "/ncdevmem"))
-        ksft_run([check_rx, check_tx, check_tx_chunks, check_rx_hds],
+        ksft_run([check_rx, check_tx, check_tx_chunks, check_rx_hds,
+                  check_rx_large_niov],
                  args=(cfg,))
     ksft_exit()
 
diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
index 0921ff03eb81..1d9ad3a294c8 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -8,7 +8,7 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
                     NetdevFamily)
 
 
-def require_devmem(cfg):
+def require_devmem(cfg, rx_buf_size=0):
     """Probe ncdevmem on cfg.ifname and SKIP the test if devmem isn't supported."""
     if not hasattr(cfg, "devmem_probed"):
         probe_command = f"{cfg.bin_local} -f {cfg.ifname}"
@@ -18,6 +18,19 @@ def require_devmem(cfg):
     if not cfg.devmem_supported:
         raise KsftSkipEx("Test requires devmem support")
 
+    if rx_buf_size > 0:
+        if not hasattr(cfg, "devmem_rx_buf_size_probed"):
+            cfg.devmem_rx_buf_size_probed = {}
+
+        if rx_buf_size not in cfg.devmem_rx_buf_size_probed:
+            probe_command = f"{cfg.bin_local} -f {cfg.ifname} -b {rx_buf_size}"
+            cfg.devmem_rx_buf_size_probed[rx_buf_size] = \
+                cmd(probe_command, fail=False, shell=True).ret == 0
+
+        if not cfg.devmem_rx_buf_size_probed[rx_buf_size]:
+            raise KsftSkipEx(
+                f"Test requires devmem rx-buf-size={rx_buf_size} support")
+
 
 def configure_nic(cfg):
     """Channels, rings, RSS, queue lease for netkit devmem."""
@@ -76,7 +89,8 @@ def set_flow_rule(cfg, port):
     return int(re.search(r'ID (\d+)', output).group(1))
 
 
-def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
+def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
+                rx_buf_size=0):
     """Build the ncdevmem RX listener command."""
     if hasattr(cfg, 'netns'):
         flow_rule_id = set_flow_rule(cfg, port)
@@ -96,6 +110,8 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
         extras.append("-v 7")
     if fail_on_linear:
         extras.append("-L")
+    if rx_buf_size > 0:
+        extras.append(f"-b {rx_buf_size}")
 
     parts = [cfg.bin_local, "-l", f"-f {ifname}", f"-s {addr}",
              f"-p {port}", *extras]
@@ -202,6 +218,32 @@ def run_tx_chunks(cfg):
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
+def run_rx_large_niov(cfg):
+    """Run the devmem RX test with a large niov (rx-buf-size > PAGE_SIZE).
+
+    Sweep payload sizes that straddle the niov boundary: below, equal to,
+    and above rx_buf_size, to exercise sub-niov, exact-niov, and multi-niov
+    RX paths.
+    """
+    require_devmem(cfg, rx_buf_size=16384)
+    configure_nic(cfg)
+    netns = getattr(cfg, "netns", None)
+
+    for size in [1024, 4096, 8192, 16384, 32768, 65536]:
+        port = rand_port()
+        socat = socat_send(cfg, port)
+        listen_cmd = ncdevmem_rx(cfg, port,
+                                 flow_steer=not netns,
+                                 rx_buf_size=16384)
+        data_pipe = (f"yes $(echo -e \x01\x02\x03\x04\x05\x06) | "
+                     f"head -c {size} | {socat}")
+        with bkg(listen_cmd, exit_wait=True, ns=netns) as ncdevmem:
+            wait_port_listen(port, proto="tcp", ns=netns)
+            cmd(data_pipe, host=cfg.remote, shell=True)
+        ksft_eq(ncdevmem.ret, 0,
+                f"large-niov failed for payload size {size}")
+
+
 def run_rx_hds(cfg):
     """Run the HDS test by running devmem RX across a segment size sweep."""
     require_devmem(cfg)
diff --git a/tools/testing/selftests/drivers/net/hw/nk_devmem.py b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
index 300ed2a70ab4..7f1867e4ff32 100755
--- a/tools/testing/selftests/drivers/net/hw/nk_devmem.py
+++ b/tools/testing/selftests/drivers/net/hw/nk_devmem.py
@@ -3,7 +3,8 @@
 """Test devmem TCP with netkit."""
 
 import os
-from devmem_lib import setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds
+from devmem_lib import (setup_test, run_rx, run_tx, run_tx_chunks, run_rx_hds,
+                        run_rx_large_niov)
 from lib.py import ksft_run, ksft_exit, ksft_disruptive
 from lib.py import NetDrvContEnv
 
@@ -31,6 +32,12 @@ def check_nk_rx_hds(cfg) -> None:
     run_rx_hds(cfg)
 
 
+@ksft_disruptive
+def check_nk_rx_large_niov(cfg) -> None:
+    """Run the devmem RX large-niov test through netkit."""
+    run_rx_large_niov(cfg)
+
+
 def main() -> None:
     """Run the netkit devmem test cases."""
     with NetDrvContEnv(__file__, rxqueues=2, primary_rx_redirect=True) as cfg:
@@ -38,7 +45,7 @@ def main() -> None:
                    os.path.join(os.path.dirname(os.path.abspath(__file__)),
                                 "ncdevmem"))
         ksft_run([check_nk_rx, check_nk_tx, check_nk_tx_chunks,
-                  check_nk_rx_hds], args=(cfg,))
+                  check_nk_rx_hds, check_nk_rx_large_niov], args=(cfg,))
     ksft_exit()
 
 

-- 
2.53.0-Meta



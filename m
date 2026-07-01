Return-Path: <linux-media+bounces-66278-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vLubB3FpRWoq/goAu9opvQ
	(envelope-from <linux-media+bounces-66278-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 21:24:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC686F0D5B
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 21:24:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XefbewQl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66278-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66278-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F1D93057BFA
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 19:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8714D2EC8;
	Wed,  1 Jul 2026 19:22:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731C84CA28E
	for <linux-media@vger.kernel.org>; Wed,  1 Jul 2026 19:22:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782933763; cv=none; b=WHaE9YcnAfgh2uRTNaT9wwW6ZvSfnJrQmLyE1OCS2Y34q9Bpwcz5y8GHdZCN7Ip9dGBIMnPTtQU6mdrJKCy51KNnxZb/OWZlD3KWyRNEIdGO1Ovb8pNDwj5EsD0X/XRQaR3MabhdLAmt+D5vyHg7MOXZWMgLz/XgTaEjDS5dY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782933763; c=relaxed/simple;
	bh=ddEMs3NvJA1JB3yt9Oe8pMGZFmOIfa9aeSQQUCmQLzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYZ8HkuOcs3LSRbBcWdwlkQSRc+p8eJlfRWQxQBls38IgRoZp1O1UltNL8JGyrmeZgD62RuNTzhrHfXJ+62EMWlEBSEu6Y9V+VNkoHt31/KyByIvxe+rH8TgjRuSgb9Zfj4RCCXevrXubrJ7fEtiiM+o1pMR6KSG4VsJ7hggFY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XefbewQl; arc=none smtp.client-ip=209.85.210.41
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9bb837fdbso422001a34.3
        for <linux-media@vger.kernel.org>; Wed, 01 Jul 2026 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782933760; x=1783538560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkMBuabZm+PqoEf0oxVPoqMrO25NNQwaWpSbZXohWaM=;
        b=XefbewQlN7u1Cilgj69P0j+ng1g7SdmEPojo40ZZJsjbB5Eo9frTl5ggm0BGTBLmwd
         rBi+A7NW5UMNqFxU1bO1FD4ZyAD4+wRlqQVv97nVpB1KM8OlclEp37M1hpzb26bDtc9k
         AoLLep6eXZmgswccVjti/AS3/pcfekSLl7LPqpziP0qIcCgbbEuCN+b/gimnjCOY8ZdB
         +p1S5P3MvAyxOtDyHDFv7imIZA6hjJyweW6J71S1hFAlAd6QHiFZzBimQv1szwr+YKFo
         PBxVYCi40HQB/aChdLqLzmn8q4OABV3eccrbTOIE++PJu9vkbO8ZPMOGDTOoLIffPTgf
         Wyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782933760; x=1783538560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lkMBuabZm+PqoEf0oxVPoqMrO25NNQwaWpSbZXohWaM=;
        b=WqEbgtwVEOoLQ+67UTJxHHJQtLHQelyw9Zns1RxnhlNx55e7cuDZjU2hDnl5huDigb
         C0A4c1Nbblvxezp35xr96ph42H5o2pcFl8tjfD7hcGePk76it7FcCuoeImq6UpVvmR5U
         bgmxK4iZWZhPeVIwQntYx8HmYuhUJcrQvvCyOVwx7WR5yhTq+MOAs9btObcMGGEWnP7+
         zb7Mq+xJmcj3wNDH41LhvBgfZDxnd8rYlBjCMQIR2VDb9KvjwT1f51UFsIPjKFfEpziE
         1BfmOngkcbIm6gCo05+N672rsyFcT2++oDmijUn3FAm0Ui03hViCDOxRGNjwY0/YE7vn
         EOog==
X-Forwarded-Encrypted: i=1; AFNElJ81NULboNJgBRMuyomCzgxjn4FR9tDQZrKC28ud2jE8J1xYWaqzcKI1SzJouPtQUHm5OA7PyHIqGED6pg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb+gDexRonxV0Y/4aFhgLprcKpiakk+fFTz7MTxIYdueTX/pza
	IN6aOvm2IgJLwABW6Zkl2Ujc2fIsQOW5DcFxxUYirQQGD5YYsWr7Xky5
X-Gm-Gg: AfdE7ckdzVyBEAvBjDHepTIAazPJQkfnbc7YfgMbUNvIIgXufHawXoo+TX1OvdzkhjL
	5m3XBQEvT5F2Cbw91qM0oDG8eujFnUYA9sSxhCR5W1ljU1C2bn1u1AmrTDDWPB5Oc56pmNYp7Hf
	e0L5cAZADcfSG6+xRGviS/p5QxNHIRi0qjmcsklpKBXDZRlxkJ+6a39PcvN0vcq2CKeK7z2uiKU
	dE7i3JpSxz0iKkirwRRTlHzuXW0fs3SxJs3sqLneJfeEKqCA/znalNWoKypO+EV+84WzQr0iaAd
	ElaeRMxhOzBnznrtyksjpYf6IxF1fLnc0C+RTUtHy8b1Uf5pcS54yhtauuRqpQYOnRLakD2Sz1y
	nvXm1AuJn5Vdio/IqsmDy6xbfEdfm0achkMQcB0/64ujXRo+fBDo8FjWYbpWagzmtkCMuwm3KjX
	hZBq0fkTw=
X-Received: by 2002:a05:6830:2907:b0:7e6:f31c:47bd with SMTP id 46e09a7af769-7eb48accaedmr1712045a34.3.1782933760276;
        Wed, 01 Jul 2026 12:22:40 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544ef7a0sm786090a34.20.2026.07.01.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 12:22:38 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 01 Jul 2026 12:22:26 -0700
Subject: [PATCH net-next v4 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-tcpdm-large-niovs-v4-3-ca4654f37570@meta.com>
References: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
In-Reply-To: <20260701-tcpdm-large-niovs-v4-0-ca4654f37570@meta.com>
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
	TAGGED_FROM(0.00)[bounces-66278-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,fomichev.me:email,meta.com:mid,meta.com:email,lib.py:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AC686F0D5B

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add a new devmem test case for binding the dmabuf with rx-buf-size=16K.
The test sweeps RX payload sizes straddling the niov boundary to cover
the sub-niov, exact-niov, and multi-niov RX paths.

Silence pylint invalid-name (`with open() as f`) and too-many-arguments
(ncdevmem_rx grew to 6 args) at file scope.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/drivers/net/hw/devmem.py   | 12 ++++-
 .../testing/selftests/drivers/net/hw/devmem_lib.py | 59 +++++++++++++++++++++-
 .../testing/selftests/drivers/net/hw/nk_devmem.py  | 11 +++-
 3 files changed, 76 insertions(+), 6 deletions(-)

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
index 0921ff03eb81..7b8557959c40 100644
--- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
+++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+# pylint: disable=invalid-name,too-many-arguments
 """Shared helpers for devmem TCP selftests."""
 
 import re
@@ -8,7 +9,7 @@ from lib.py import (bkg, cmd, defer, ethtool, rand_port, wait_port_listen,
                     NetdevFamily)
 
 
-def require_devmem(cfg):
+def require_devmem(cfg, rx_buf_size=0):
     """Probe ncdevmem on cfg.ifname and SKIP the test if devmem isn't supported."""
     if not hasattr(cfg, "devmem_probed"):
         probe_command = f"{cfg.bin_local} -f {cfg.ifname}"
@@ -18,6 +19,19 @@ def require_devmem(cfg):
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
@@ -76,7 +90,8 @@ def set_flow_rule(cfg, port):
     return int(re.search(r'ID (\d+)', output).group(1))
 
 
-def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
+def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False,
+                rx_buf_size=0):
     """Build the ncdevmem RX listener command."""
     if hasattr(cfg, 'netns'):
         flow_rule_id = set_flow_rule(cfg, port)
@@ -96,6 +111,8 @@ def ncdevmem_rx(cfg, port, verify=True, fail_on_linear=False, flow_steer=False):
         extras.append("-v 7")
     if fail_on_linear:
         extras.append("-L")
+    if rx_buf_size > 0:
+        extras.append(f"-b {rx_buf_size}")
 
     parts = [cfg.bin_local, "-l", f"-f {ifname}", f"-s {addr}",
              f"-p {port}", *extras]
@@ -202,6 +219,44 @@ def run_tx_chunks(cfg):
     ksft_eq(socat.stdout.strip(), "hello\nworld")
 
 
+def _restore_nr_hugepages(hp_file, nr_hugepages):
+    with open(hp_file, 'w', encoding='utf-8') as f:
+        f.write(str(nr_hugepages))
+
+
+def run_rx_large_niov(cfg):
+    """Run the devmem RX test with a large niov (rx-buf-size > PAGE_SIZE).
+
+    Sweep payload sizes that straddle the niov boundary: below, equal to,
+    and above rx_buf_size, to exercise sub-niov, exact-niov, and multi-niov
+    RX paths.
+    """
+    hp_file = "/proc/sys/vm/nr_hugepages"
+    with open(hp_file, 'r+', encoding='utf-8') as f:
+        nr_hugepages = int(f.read().strip())
+        if nr_hugepages < 64:
+            f.seek(0)
+            f.write("64")
+            defer(_restore_nr_hugepages, hp_file, nr_hugepages)
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



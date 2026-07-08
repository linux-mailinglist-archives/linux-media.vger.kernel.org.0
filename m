Return-Path: <linux-media+bounces-67081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uyBbH6jVTmpjVAIAu9opvQ
	(envelope-from <linux-media+bounces-67081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:56:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E15472B013
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 00:56:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=m1NK5O8q;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67081-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67081-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3577A300AC85
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 22:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203463AF647;
	Wed,  8 Jul 2026 22:55:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C23ACA7C
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 22:55:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783551323; cv=none; b=uqPyqw1ob/oq1T2GeP2jgakIcXJN/Hs9XQxDVwdUsAH0ue15/QXjGUKn9bH2At9icPwK2g8MK7ZWBzFNPoqufEoV0Q++NoNbOZj4AkS69sT3FXxwuAHyPWivq/C9CTZIs/YMPQF2y9+Kx4qpW6R5E3yPy8B/ZauAG1xThlrQwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783551323; c=relaxed/simple;
	bh=ddEMs3NvJA1JB3yt9Oe8pMGZFmOIfa9aeSQQUCmQLzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWNFJLcq+Dgfp0PuT9RAdgCjEf6EKaGExcUCiU5QcJ2M34a3F+mIYkCoP09vqxpFY+ySr78siyeoq18cWQWM2fuZvYYKSDpqGFWkFZAMSg/nb7Mgi2P56KLEsD+e3gotqgPDe/8XddJeVcKwU0V5EbXRiiHrLlt0s32x+2DjVWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1NK5O8q; arc=none smtp.client-ip=209.85.160.53
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-448479e0eb6so834981fac.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783551321; x=1784156121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkMBuabZm+PqoEf0oxVPoqMrO25NNQwaWpSbZXohWaM=;
        b=m1NK5O8qaoqd2/eL+wG7p0LXcH15aEE1QzaAXMSACi+WkoLB589afmKB5RPUiWb+Gc
         skACwSTxLTqDsai0azWNvb+WENh7E8PsV2G80M3Pm6o3ESJ+HyGOBO+BwoX+GWkSGVyt
         p7BAMqqNiXXPryz+UlYijyG20wncqV54PhhdmO2a2q5OoHwEmDSwkF2XvijPpH5mLtmr
         7MU8Nu9gj+VCy/ICW4m9dNxb7VmF495WJDBPdldPvOWwkpZEVzwMxr4QHlnyi9d/KwEH
         dtmkFf7XKrKuSAi8u5Xz537ulWrw8smzvo8cUwZ+jQaQyC2eZsrEx00k6FL3K2slV6jy
         X11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783551321; x=1784156121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkMBuabZm+PqoEf0oxVPoqMrO25NNQwaWpSbZXohWaM=;
        b=LWOUuS7TQKglcDBjcrK/0HsC5k9fDGCrRZ1W0Ac77un2YRKkiHsRUxYUvh0aQmk1k6
         vSq8TnR3LMR3WpxoGhDijWw2TtZNpGrKaZqIUROOeXgx2CKmsvZau0VYCMTkbT1IlMtH
         nkgc0+8IF3erPLsc9Q1a+AaKcLbiHZmHQHVSYeHDC1b3M16NXMnceP0UVtr1vU9sszgH
         uHZ7cy3sb6wcVBuDwR7QLDMEuy2tTCWfbFAKqiSqgrVrEnkr4tou/iQuylvZ22LSOXEz
         CJkAdrVvHD0dyUP2y1M5/sH6t81QA7OQtTTJISjdLA7d7DgcfYTf0ogH1nnNhm7zjbcv
         V5dg==
X-Forwarded-Encrypted: i=1; AHgh+RqlOzlPrzifEwHEkDho4ZFxYlNKr7C2gNTXK1g+hzVVsS8KwNKRPX725FlJyjvIoJ9sE6x/z9S+Zj0GRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLAKHZvK792KXFOgivVeCmNs4wZ3208ULMq7j0NakysH3naWhF
	wqpyo78vnL3tN9M+xCbdil6BWhYdaUaoNohZBCxT1a5oQarMyR5KG/tH
X-Gm-Gg: AfdE7clAsrzGJ7WM3+Ual8z5IlQ7XDFvvZQSBQ+M0ek508X5jl3tP7s0gN+PLQu/FHl
	a2jc3rGzAgQyxYRb04eHri1kEW/BkiqKm5tqfjMCab+kd4jIsY5nYs84E/h6XImrCo/yuJT6Rr6
	Ac+B+NQPhiaTrVzz6HceVpLrjJS4Ba07mr9qhaPyl5SF8sVWzFAOMyqmwBhm5f4XOy6FQfW5JW9
	9BBnlp8zpkKi1So8NL7rMukG8ZGCWSdHr+O5IsFlEgk+6Js5oB9msVmFc0MxzU2kWlntjhYCdXU
	0lHh0GhoaKTsL0y6Ypu+vY9u0KyoVokcD2pZ0yHJnixge+y3Vlbmt4NzAmhCBbpkT2YflXm11n9
	YKT2oa3m2wNXjdEPek9VjUmS87SjqBBfKTrke3gr3JiDFioqX5MOIGRzS2rWy9YFkcgV6fOVidM
	gKB+Qql+Ng
X-Received: by 2002:a05:6870:46a3:b0:43a:5cd0:db00 with SMTP id 586e51a60fabf-45163c20a2emr2972665fac.23.1783551320685;
        Wed, 08 Jul 2026 15:55:20 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4e::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45190b7d08asm354328fac.0.2026.07.08.15.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:55:19 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 08 Jul 2026 15:55:06 -0700
Subject: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
In-Reply-To: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67081-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E15472B013

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



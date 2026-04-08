Return-Path: <linux-media+bounces-58239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNcgLaBp1mnIEwgAu9opvQ
	(envelope-from <linux-media+bounces-58239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:43:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 192613BDCE3
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4711302795B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 14:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C99F386C3A;
	Wed,  8 Apr 2026 14:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="adIUNr4/"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5122D27CCE0
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775659260; cv=none; b=bWf55UQk/rfKqQkgtAZ2HS/2ldwDPKN6feTJVHBvBGsIiJ/WlGT1EDVNpmKxmtVeYuiTmFfO4Vxk4XpJZsJhOdWeVaCl59FoBjoP989XEFdwFlho6F2NWW3dWn3bJwywILfGAlXdYpyCim4jgopwhqrIFYIpTk5dHmdaN9KvzVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775659260; c=relaxed/simple;
	bh=IMvz08Aw3G8MlSYQpAHc0hkSTfMw1wgVDsXpL2MMhFw=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=IMBZsFEowWVpcoKR++O5cENDxpRXMuTSKTnglENaqwYQJHtX2P6ZlcLaiUu9WLQtuKA1KUQyklA4dOy2RhwmuYwe0dzg3JUM2uFAcYosMZfpCqIPPToT8IW0jmevGd8JugCUtICrPdpe5eNbaeXnKk/bhsflVgy5YCT+jpeN6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=adIUNr4/; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zkxZ9pOz3cot6dGZUuC7CGKCnvkedXrEpyP7MoRqM68=; b=adIUNr4/tXivUuZWeED+iOVMWo
	9Gu2Dyn61eRxK2kjLrYQ70OEX14Po0YwBdikBGa38VJtlypSbXX+Gqgbu3ReED1XHDJIPcYeSGVv0
	tpUzjCXeosLBIMqL5PfWNaN9TL3AfgK3jKSePyWLeDW/YGf6ANUQHG9xWI5R9euGnMJmSbGg/ND1s
	SEvMWijUVEmyl7OMPgjpwyGsCw+fIOvVuSmGMk9CIq2WvNaxonnmqDSTWR1tu2+TjSwknBCqrjc/E
	M56S/ydI8BOIqSUDsZ0h1QjLb8TIZPzHe7jZob50NBq53L0bj+6dbQMuoBA7fF/WJxvf2/L/K/K+2
	AG5hKkxw==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wAU5R-0004hb-3A;
	Wed, 08 Apr 2026 14:40:57 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wAU5R-000FtL-2r;
	Wed, 08 Apr 2026 14:40:57 +0000
Date: Wed, 8 Apr 2026 14:40:57 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <2108603301.8.1775659257885@builder.linuxtv.org>
In-Reply-To: <214666674.7.1775658948330@builder.linuxtv.org>
References: <214666674.7.1775658948330@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #40
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: dtv-scan-tables
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[linuxtv.org:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxtv.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxtv.org:-];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58239-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jenkins@linuxtv.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.910];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[builder.linuxtv.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: 192613BDCE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/40/display/redirect>

Changes:


------------------------------------------
[...truncated 15.93 KiB...]
[88/309] Linking target lib/libv4lconvert/ov511-decomp
[89/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/spca501.c.o
[90/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/sn9c2028-decomp.c.o
[91/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/stv0680.c.o
[92/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/sq905c.c.o
[93/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/sn9c20x.c.o
[94/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/spca561-decompress.c.o
[95/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/jpeg_memsrcdest.c.o
[96/309] Compiling C object lib/libv4l2/libv4l2.so.0.0.0.p/log.c.o
[97/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/tinyjpeg.c.o
[98/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/helper.c.o
[99/309] Compiling C object lib/libv4l2/libv4l2.so.0.0.0.p/v4l2-plugin.c.o
[100/309] Compiling C object lib/libv4l2/v4l2convert.so.p/v4l2convert.c.o
[101/309] Compiling C object lib/libv4l1/libv4l1.so.0.0.0.p/log.c.o
[102/309] Compiling C object lib/libv4l1/libv4l1.so.0.0.0.p/libv4l1.c.o
[103/309] Compiling C object lib/libv4l2/libv4l2.so.0.0.0.p/libv4l2.c.o
[104/309] Compiling C object lib/libv4l1/v4l1compat.so.p/v4l1compat.c.o
[105/309] Compiling C object lib/libv4l-mplane/libv4l-mplane.so.p/libv4l-mplane.c.o
[106/309] Compiling C object lib/libv4l2rds/libv4l2rds.so.0.0.0.p/libv4l2rds.c.o
[107/309] Linking target lib/libdvbv5/libdvbv5.so.0.0.0
[108/309] Compiling C object utils/libmedia_dev/libmedia_dev.a.p/get_media_devices.c.o
[109/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-parse.cpp.o
[110/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-info.cpp.o
[111/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-log.cpp.o
[112/309] Linking static target utils/libmedia_dev/libmedia_dev.a
[113/309] Linking static target utils/libcecutil/libcecutil.a
[114/309] Compiling C object utils/libv4l2util/libv4l2util.a.p/frequencies.c.o
[115/309] Linking target lib/libv4l-mplane/libv4l-mplane.so
[116/309] Linking target lib/libv4l2rds/libv4l2rds.so.0.0.0
[117/309] Compiling C object utils/libv4l2util/libv4l2util.a.p/v4l2_driver.c.o
[118/309] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-pin.cpp.o
[119/309] Linking static target utils/libv4l2util/libv4l2util.a
[120/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-processing.cpp.o
[121/309] Linking target lib/libv4lconvert/libv4lconvert.so.0.0.0
[122/309] Compiling C object utils/cx18-ctl/cx18-ctl.p/cx18-ctl.c.o
[123/309] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-ctl.cpp.o
[124/309] Compiling C object utils/dvb/dvb-fe-tool.p/dvb-fe-tool.c.o
[125/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-follower.cpp.o
[126/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-tuner.cpp.o
[127/309] Compiling C object utils/dvb/dvbv5-scan.p/dvbv5-scan.c.o
[128/309] Compiling C object utils/dvb/dvbv5-zap.p/dvbv5-zap.c.o
[129/309] Linking target utils/cx18-ctl/cx18-ctl
[130/309] Compiling C object utils/dvb/dvb-format-convert.p/dvb-format-convert.c.o
[131/309] Compiling C object utils/dvb/dvbv5-daemon.p/dvbv5-daemon.c.o
[132/309] Compiling C++ object utils/edid-decode/edid-decode.p/calc-gtf-cvt.cpp.o
[133/309] Compiling C++ object utils/edid-decode/edid-decode.p/calc-ovt.cpp.o
[134/309] Compiling C++ object utils/edid-decode/edid-decode.p/edid-decode.cpp.o
[135/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-base-block.cpp.o
[136/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-displayid-block.cpp.o
[137/309] Generating utils/media-bus-format-codes.h with a custom command (wrapped by meson to capture output)
[138/309] Linking target utils/cec-follower/cec-follower
[139/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-di-ext-block.cpp.o
[140/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-cta-block.cpp.o
[141/309] Generating utils/media-bus-format-names.h with a custom command (wrapped by meson to capture output)
[142/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-ls-ext-block.cpp.o
[143/309] Linking target utils/cec-ctl/cec-ctl
[144/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-vtb-ext-block.cpp.o
[145/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-if.cpp.o
[146/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-eld.cpp.o
[147/309] Compiling C object utils/ir-ctl/ir-ctl.p/ir-ctl.c.o
[148/309] Compiling C object utils/ir-ctl/ir-ctl.p/bpf_encoder.c.o
[149/309] Compiling C++ object utils/edid-decode/edid-decode.p/ddc.cpp.o
[150/309] Compiling C object utils/keytable/ir-keytable.p/ir-encode.c.o
[151/309] Compiling C object utils/ir-ctl/ir-ctl.p/keymap.c.o
[152/309] Compiling C object utils/ivtv-ctl/ivtv-ctl.p/ivtv-ctl.c.o
[153/309] Compiling C object utils/keytable/ir-keytable.p/keymap.c.o
[154/309] Compiling C object utils/ir-ctl/ir-ctl.p/toml.c.o
[155/309] Compiling C object utils/ir-ctl/ir-ctl.p/ir-encode.c.o
[156/309] Compiling C object utils/keytable/ir-keytable.p/toml.c.o
[157/309] Compiling C object utils/keytable/ir-keytable.p/keytable.c.o
[158/309] Compiling C object utils/media-ctl/media-ctl.p/media-ctl.c.o
[159/309] Compiling C object utils/media-ctl/libv4l2subdev.a.p/libv4l2subdev.c.o
[160/309] Compiling C object utils/media-ctl/libmediactl.a.p/libmediactl.c.o
[161/309] Linking static target utils/media-ctl/libv4l2subdev.a
[162/309] Linking static target utils/media-ctl/libmediactl.a
[163/309] Compiling C object utils/media-ctl/media-ctl.p/options.c.o
[164/309] Generating 'utils/qv4l2/qv4l2.p/moc_qv4l2.cpp'.
[165/309] Linking target utils/ivtv-ctl/ivtv-ctl
[166/309] Linking target utils/ir-ctl/ir-ctl
[167/309] Generating 'utils/qv4l2/qv4l2.p/moc_general-tab.cpp'.
[168/309] Generating utils/qv4l2/qt5-qv4l2_qrc with a custom command
[169/309] Generating 'utils/qv4l2/qv4l2.p/moc_capture-win.cpp'.
[170/309] Generating 'utils/qv4l2/qv4l2.p/moc_vbi-tab.cpp'.
[171/309] Linking target utils/keytable/ir-keytable
[172/309] Linking target utils/media-ctl/media-ctl
[173/309] Compiling C object utils/qv4l2/qv4l2.p/alsa_stream.c.o
[174/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_general-tab.cpp.o
[175/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_vbi-tab.cpp.o
[176/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_qv4l2.cpp.o
[177/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_capture-win.cpp.o
[178/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win-qt.cpp.o
[179/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win.cpp.o
[180/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win-gl.cpp.o
[181/309] Compiling C++ object utils/qv4l2/qv4l2.p/ctrl-tab.cpp.o
[182/309] Compiling C++ object utils/qv4l2/qv4l2.p/general-tab.cpp.o
[183/309] Compiling C++ object utils/qv4l2/qv4l2.p/raw2sliced.cpp.o
[184/309] Compiling C++ object utils/qv4l2/qv4l2.p/tpg-tab.cpp.o
[185/309] Compiling C object utils/qv4l2/qv4l2.p/v4l2-tpg-core.c.o
[186/309] Compiling C++ object utils/qv4l2/qv4l2.p/qv4l2.cpp.o
[187/309] Generating utils/qvidcap/qt5-qvidcap_qrc with a custom command
[188/309] Compiling C object utils/qv4l2/qv4l2.p/v4l2-tpg-colors.c.o
[189/309] Generating 'utils/qvidcap/qvidcap.p/moc_capture.cpp'.
[190/309] Linking target utils/edid-decode/edid-decode
[191/309] Compiling C object utils/qvidcap/qvidcap.p/codec-fwht.c.o
[192/309] Compiling C++ object utils/qv4l2/qv4l2.p/vbi-tab.cpp.o
[193/309] Compiling C object utils/qvidcap/qvidcap.p/codec-v4l2-fwht.c.o
[194/309] Compiling C++ object utils/qvidcap/qvidcap.p/meson-generated_moc_capture.cpp.o
[195/309] Compiling C object utils/qvidcap/qvidcap.p/v4l-stream.c.o
[196/309] Compiling C++ object utils/qvidcap/qvidcap.p/qvidcap.cpp.o
[197/309] Compiling C object utils/qvidcap/qvidcap.p/v4l2-tpg-colors.c.o
[198/309] Compiling C++ object utils/qvidcap/qvidcap.p/capture.cpp.o
[199/309] Compiling C++ object utils/qvidcap/qvidcap.p/paint.cpp.o
[200/309] Compiling C object utils/qvidcap/qvidcap.p/v4l2-tpg-core.c.o
[201/309] Compiling C++ object utils/qvidcap/qvidcap.p/v4l2-info.cpp.o
[202/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-fwht.c.o
[203/309] Compiling C++ object utils/rds-ctl/rds-ctl.p/v4l2-info.cpp.o
[204/309] Compiling C++ object utils/rds-ctl/rds-ctl.p/rds-ctl.cpp.o
[205/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-v4l2-fwht.c.o
[206/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l-stream.c.o
[207/309] Compiling C++ object utils/qvidcap/qvidcap.p/meson-generated_.._qt5-qvidcap_qrc.cpp.o
[208/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_.._qt5-qv4l2_qrc.cpp.o
[209/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-io.cpp.o
[210/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/media-info.cpp.o
[211/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-meta.cpp.o
[212/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-edid.cpp.o
[213/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-modes.cpp.o
[214/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-common.cpp.o
[215/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-misc.cpp.o
[216/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-sdr.cpp.o
[217/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-overlay.cpp.o
[218/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-stds.cpp.o
[219/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-selection.cpp.o
[220/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-subdev.cpp.o
[221/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-tuner.cpp.o
[222/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vbi.cpp.o
[223/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidcap.cpp.o
[224/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-streaming.cpp.o
[225/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidout.cpp.o
[226/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-core.c.o
[227/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-colors.c.o
[228/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl.cpp.o
[229/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-info.cpp.o
[230/309] Compiling C object utils/v4l2-sysfs-path/v4l2-sysfs-path.p/v4l2-sysfs-path.c.o
[231/309] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-info.cpp.o
[232/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-fuzzing.cpp.o
[233/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-compliance.cpp.o
[234/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-adapter.cpp.o
[235/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-audio.cpp.o
[236/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-power.cpp.o
[237/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-tuner-record-timer.cpp.o
[238/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test.cpp.o
[239/309] Linking target utils/v4l2-sysfs-path/v4l2-sysfs-path
[240/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/media-info.cpp.o
[241/309] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-dbg.cpp.o
[242/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-info.cpp.o
[243/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-colors.cpp.o
[244/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-compliance.cpp.o
[245/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-codecs.cpp.o
[246/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-buffers.cpp.o
[247/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-debug.cpp.o
[248/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-io-config.cpp.o
[249/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-formats.cpp.o
[250/309] Linking target utils/cec-compliance/cec-compliance
[251/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-input-output.cpp.o
[252/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-time32-64.cpp.o
[253/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-controls.cpp.o
[254/309] Compiling C object contrib/test/ioctl-test.p/ioctl-test.c.o
[255/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-subdevs.cpp.o
[256/309] Compiling C object contrib/test/sliced-vbi-test.p/sliced-vbi-test.c.o
[257/309] Compiling C object contrib/test/sliced-vbi-detect.p/sliced-vbi-detect.c.o
[258/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-media.cpp.o
[259/309] Compiling C object contrib/test/v4l2grab.p/v4l2grab.c.o
[260/309] Compiling C object contrib/test/driver-test.p/driver-test.c.o
[261/309] Compiling C object contrib/test/mc-nextgen-test.p/mc_nextgen_test.c.o
[262/309] Compiling C object contrib/test/stress-buffer.p/stress-buffer.c.o
[263/309] Linking target contrib/test/ioctl-test
[264/309] Linking target contrib/test/sliced-vbi-test
[265/309] Linking target contrib/test/sliced-vbi-detect
[266/309] Compiling C object contrib/test/capture-example.p/capture-example.c.o
[267/309] Linking target contrib/test/stress-buffer
[268/309] Linking target contrib/test/driver-test
[269/309] Linking target utils/v4l2-dbg/v4l2-dbg
[270/309] Linking target contrib/test/mc-nextgen-test
[271/309] Compiling C object contrib/rds-saa6588/rds-saa6588.p/rds-saa6588.c.o
[272/309] Linking target contrib/test/capture-example
[273/309] Compiling C object contrib/test/pixfmt-test.p/pixfmt-test.c.o
[274/309] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/firmware-tool.c.o
[275/309] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/standards.c.o
[276/309] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
[277/309] Compiling C object contrib/gconv/ARIB-STD-B24.so.p/arib-std-b24.c.o
[278/309] Linking target contrib/rds-saa6588/rds-saa6588
[279/309] Compiling C object contrib/gconv/EN300-468-TAB00.so.p/en300-468-tab00.c.o
[280/309] Linking target contrib/xc3028-firmware/xc3028-firmware
[281/309] Linking target contrib/gconv/ARIB-STD-B24.so
[282/309] Compiling C object contrib/decode_tm6000/decode_tm6000.p/decode_tm6000.c.o
[283/309] Linking target contrib/gconv/EN300-468-TAB00.so
[284/309] Linking target contrib/decode_tm6000/decode_tm6000
[285/309] Linking target contrib/test/pixfmt-test
[286/309] Compiling C object contrib/test/sdlcam.p/sdlcam.c.o
[287/309] Generating doc/doxygen with a custom command
<https://builder.linuxtv.org/job/dtv-scan-tables/ws/v4l-utils/lib/include/libdvbv5/dvb-dev.h>:321: warning: argument 'open_dev' from the argument list of dvb_dev_get_fd has multiple @param documentation sections
[288/309] Generating symbol file lib/libv4l2rds/libv4l2rds.so.0.0.0.p/libv4l2rds.so.0.0.0.symbols
[289/309] Generating symbol file lib/libdvbv5/libdvbv5.so.0.0.0.p/libdvbv5.so.0.0.0.symbols
[290/309] Generating symbol file lib/libv4lconvert/libv4lconvert.so.0.0.0.p/libv4lconvert.so.0.0.0.symbols
[291/309] Linking target utils/dvb/dvb-format-convert
[292/309] Linking target utils/dvb/dvb-fe-tool
[293/309] Linking target utils/dvb/dvbv5-zap
[294/309] Linking target utils/dvb/dvbv5-daemon
[295/309] Linking target utils/dvb/dvbv5-scan
[296/309] Linking target lib/libv4l2/libv4l2.so.0.0.0
[297/309] Linking target utils/rds-ctl/rds-ctl
[298/309] Generating symbol file lib/libv4l2/libv4l2.so.0.0.0.p/libv4l2.so.0.0.0.symbols
[299/309] Linking target lib/libv4l2/v4l2convert.so
[300/309] Linking target lib/libv4l1/libv4l1.so.0.0.0
[301/309] Linking target contrib/test/v4l2grab
[302/309] Linking target contrib/test/v4l2gl
[303/309] Generating symbol file lib/libv4l1/libv4l1.so.0.0.0.p/libv4l1.so.0.0.0.symbols
[304/309] Linking target lib/libv4l1/v4l1compat.so
[305/309] Linking target contrib/test/sdlcam
[306/309] Linking target utils/v4l2-ctl/v4l2-ctl
[307/309] Linking target utils/v4l2-compliance/v4l2-compliance
[308/309] Linking target utils/qvidcap/qvidcap
[309/309] Linking target utils/qv4l2/qv4l2
+ pwd
+ DVB_FORMAT_CONVERT=<https://builder.linuxtv.org/job/dtv-scan-tables/ws/v4l-utils/build/utils/dvb/dvb-format-convert> make
ERROR value 1/4 is invalid for INNER_FEC while parsing line 134 of dvb-s/Intelsat-35-34.5W
Error reading file dvb-s/Intelsat-35-34.5W
Reading file dvb-s/Intelsat-35-34.5W
ERROR value 13/45 is invalid for INNER_FEC while parsing line 144 of dvb-s/Intelsat-38-45.0E
Error reading file dvb-s/Intelsat-38-45.0E
Reading file dvb-s/Intelsat-38-45.0E
ERROR value  is invalid for INNER_FEC while parsing line 65 of dvb-s/Intelsat-906-64.2E
Error reading file dvb-s/Intelsat-906-64.2E
Reading file dvb-s/Intelsat-906-64.2E
ERROR value  is invalid for INNER_FEC while parsing line 173 of dvb-s/Intelsat-905-45.3W
Error reading file dvb-s/Intelsat-905-45.3W
Reading file dvb-s/Intelsat-905-45.3W
Reading file dvb-s/Paksat-MM1R-38.0E
Writing file dvbv3/dvb-s/Paksat-MM1R-38.0E
make: *** [Makefile:49: dvbv3/dvb-s/Intelsat-35-34.5W] Error 255
make: *** Waiting for unfinished jobs....
make: *** [Makefile:49: dvbv3/dvb-s/Intelsat-38-45.0E] Error 255
make: *** [Makefile:49: dvbv3/dvb-s/Intelsat-905-45.3W] Error 255
make: *** [Makefile:49: dvbv3/dvb-s/Intelsat-906-64.2E] Error 255
ERROR value 1/4 is invalid for INNER_FEC while parsing line 178 of dvb-s/Rascom-QAF-1R-3.0E
Error reading file dvb-s/Rascom-QAF-1R-3.0E
Reading file dvb-s/Rascom-QAF-1R-3.0E
make: *** [Makefile:50: dvbv3/dvb-s/Rascom-QAF-1R-3.0E] Error 255
Build step 'Execute shell' marked build as failure


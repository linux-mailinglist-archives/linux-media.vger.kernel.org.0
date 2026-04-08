Return-Path: <linux-media+bounces-58236-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPnSEZ5n1mnIEwgAu9opvQ
	(envelope-from <linux-media+bounces-58236-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:35:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B33BDB88
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 16:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E101530851CC
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B913D34B8;
	Wed,  8 Apr 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b="ODOsCBJ4"
X-Original-To: linux-media@vger.kernel.org
Received: from linuxtv.org (140-211-166-241-openstack.osuosl.org [140.211.166.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114435F615
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775658658; cv=none; b=CnvfHN4xVG+px5NE92F21qA5jmBwn0Leg77CjReSp538D6s/ZJ7xiw6jtC2QgXh+Kl6UlaY0PqcS2z1L8CY6/LEjofAYdH2drW9VwueHClHzka9N4+Vh47R2YhtkdGj+Rd80augRC4Wjs6O1Rx5sD1eaf4uK1/H/+ZS5z18SFyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775658658; c=relaxed/simple;
	bh=U31J9JVF9YtyJXoxHT5ih2WKpOuERymhJ0hXMNMvQkk=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=nzS0eCnuCxgU7mk+IOtF8hmuO/OpI5/Njnd9yC+YJEWfzx41j1pQ+KpkuGW9xYivAcNRbNZ/uTFe/8FptuuwZKYpxXOQjgO4KKzBw7bfw56b/8+xK0GwMBZ6KbU5M1fXz+7dDyoba1gFbaHhl5EX/iUHFh8tlQsg8POToEh4mqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org; spf=pass smtp.mailfrom=linuxtv.org; dkim=pass (2048-bit key) header.d=linuxtv.org header.i=@linuxtv.org header.b=ODOsCBJ4; arc=none smtp.client-ip=140.211.166.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxtv.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtv.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linuxtv.org
	; s=s1; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=U31J9JVF9YtyJXoxHT5ih2WKpOuERymhJ0hXMNMvQkk=; b=ODOsCBJ4RJP5IlA+YflKrNT5eh
	RZo4iIvikcR7JgKMs7CkKGu+9fWUsYg5ng3he+RipVLOPSmpVEpy7ZuE5mIPZM7eiInTInGAPzAIz
	35S/FjAlQdKRkXU8ltbZSLkIQyWIHxYI/ZamOeiZAoSJn8mtk3x1AiwBkmIKgPChO/AnndmxtTl4w
	nCnisp1KHHSqbawyiUAkaaPea+lYdqy9WQ1+s/u33McSAtHR6FcTx57u3Ey01xqQK04h7gMn8Xe7F
	jXgb+m2aQc5O3L0+IRDUnFsPBW/ONp7LbXViPDfxI/DjSTsqZROqsgPr7Yu9LkQDugTr0KdccvU8/
	rhbiJdMQ==;
Received: from [2605:bc80:3010:501:f816:3eff:fed7:54db] (helo=builder.linuxtv.org)
	by linuxtv.org with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wATvk-0004TG-2G;
	Wed, 08 Apr 2026 14:30:56 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
	by builder.linuxtv.org with esmtp (Exim 4.96)
	(envelope-from <jenkins@linuxtv.org>)
	id 1wATvk-000FnL-1z;
	Wed, 08 Apr 2026 14:30:56 +0000
Date: Wed, 8 Apr 2026 14:30:56 +0000 (UTC)
From: Jenkins Builder Robot  <jenkins@linuxtv.org>
To: mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1173339489.5.1775658656613@builder.linuxtv.org>
In-Reply-To: <831108703.4.1775633446455@builder.linuxtv.org>
References: <831108703.4.1775633446455@builder.linuxtv.org>
Subject: Build failed in Jenkins: dtv-scan-tables #37
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
	TAGGED_FROM(0.00)[bounces-58236-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.906];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[builder.linuxtv.org:mid,linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B65B33BDB88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

See <https://builder.linuxtv.org/job/dtv-scan-tables/37/display/redirect>

Changes:


------------------------------------------
[...truncated 16.02 KiB...]
[90/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/stv0680.c.o
[91/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/jpeg_memsrcdest.c.o
[92/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/spca501.c.o
[93/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/sq905c.c.o
[94/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/helper.c.o
[95/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/spca561-decompress.c.o
[96/309] Compiling C object lib/libv4l2/libv4l2.so.0.0.0.p/log.c.o
[97/309] Compiling C object lib/libv4l2/libv4l2.so.0.0.0.p/v4l2-plugin.c.o
[98/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/libv4lconvert.c.o
[99/309] Compiling C object lib/libv4l2/v4l2convert.so.p/v4l2convert.c.o
[100/309] Compiling C object lib/libv4l1/libv4l1.so.0.0.0.p/log.c.o
[101/309] Compiling C object lib/libv4l1/v4l1compat.so.p/v4l1compat.c.o
[102/309] Generating utils/media-bus-format-names.h with a custom command (wrapped by meson to capture output)
[103/309] Compiling C object lib/libv4l-mplane/libv4l-mplane.so.p/libv4l-mplane.c.o
[104/309] Generating utils/media-bus-format-codes.h with a custom command (wrapped by meson to capture output)
[105/309] Linking target lib/libv4l-mplane/libv4l-mplane.so
[106/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/rgbyuv.c.o
[107/309] Compiling C object utils/libv4l2util/libv4l2util.a.p/frequencies.c.o
[108/309] Compiling C object lib/libv4l1/libv4l1.so.0.0.0.p/libv4l1.c.o
[109/309] Compiling C object utils/libmedia_dev/libmedia_dev.a.p/get_media_devices.c.o
[110/309] Linking static target utils/libmedia_dev/libmedia_dev.a
[111/309] Compiling C object lib/libv4l2rds/libv4l2rds.so.0.0.0.p/libv4l2rds.c.o
[112/309] Compiling C object lib/libv4lconvert/libv4lconvert.so.0.0.0.p/tinyjpeg.c.o
[113/309] Linking target lib/libv4l2rds/libv4l2rds.so.0.0.0
[114/309] Linking target lib/libv4lconvert/libv4lconvert.so.0.0.0
[115/309] Compiling C object lib/libv4l2/libv4l2.so.0.0.0.p/libv4l2.c.o
[116/309] Compiling C object utils/libv4l2util/libv4l2util.a.p/v4l2_driver.c.o
[117/309] Linking static target utils/libv4l2util/libv4l2util.a
[118/309] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-pin.cpp.o
[119/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-log.cpp.o
[120/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-info.cpp.o
[121/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-follower.cpp.o
[122/309] Compiling C object utils/dvb/dvb-fe-tool.p/dvb-fe-tool.c.o
[123/309] Compiling C object utils/cx18-ctl/cx18-ctl.p/cx18-ctl.c.o
[124/309] Linking target utils/cx18-ctl/cx18-ctl
[125/309] Compiling C++ object utils/libcecutil/libcecutil.a.p/cec-parse.cpp.o
[126/309] Linking static target utils/libcecutil/libcecutil.a
[127/309] Compiling C object utils/dvb/dvbv5-scan.p/dvbv5-scan.c.o
[128/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-processing.cpp.o
[129/309] Compiling C object utils/dvb/dvb-format-convert.p/dvb-format-convert.c.o
[130/309] Compiling C++ object utils/cec-follower/cec-follower.p/cec-tuner.cpp.o
[131/309] Compiling C object utils/dvb/dvbv5-zap.p/dvbv5-zap.c.o
[132/309] Linking target utils/cec-follower/cec-follower
[133/309] Compiling C++ object utils/edid-decode/edid-decode.p/calc-ovt.cpp.o
[134/309] Compiling C object utils/dvb/dvbv5-daemon.p/dvbv5-daemon.c.o
[135/309] Compiling C++ object utils/edid-decode/edid-decode.p/calc-gtf-cvt.cpp.o
[136/309] Generating symbol file lib/libv4lconvert/libv4lconvert.so.0.0.0.p/libv4lconvert.so.0.0.0.symbols
[137/309] Generating symbol file lib/libdvbv5/libdvbv5.so.0.0.0.p/libdvbv5.so.0.0.0.symbols
[138/309] Generating symbol file lib/libv4l2rds/libv4l2rds.so.0.0.0.p/libv4l2rds.so.0.0.0.symbols
[139/309] Linking target utils/dvb/dvb-fe-tool
[140/309] Linking target utils/dvb/dvbv5-zap
[141/309] Linking target lib/libv4l2/libv4l2.so.0.0.0
[142/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-ls-ext-block.cpp.o
[143/309] Linking target utils/dvb/dvb-format-convert
[144/309] Linking target utils/dvb/dvbv5-scan
[145/309] Linking target utils/dvb/dvbv5-daemon
[146/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-di-ext-block.cpp.o
[147/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-vtb-ext-block.cpp.o
[148/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-eld.cpp.o
[149/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-if.cpp.o
[150/309] Compiling C object utils/ir-ctl/ir-ctl.p/bpf_encoder.c.o
[151/309] Compiling C++ object utils/edid-decode/edid-decode.p/ddc.cpp.o
[152/309] Compiling C object utils/ir-ctl/ir-ctl.p/ir-encode.c.o
[153/309] Compiling C object utils/ir-ctl/ir-ctl.p/keymap.c.o
[154/309] Compiling C object utils/ir-ctl/ir-ctl.p/ir-ctl.c.o
[155/309] Compiling C++ object utils/cec-ctl/cec-ctl.p/cec-ctl.cpp.o
[156/309] Generating symbol file lib/libv4l2/libv4l2.so.0.0.0.p/libv4l2.so.0.0.0.symbols
[157/309] Linking target lib/libv4l2/v4l2convert.so
[158/309] Linking target lib/libv4l1/libv4l1.so.0.0.0
[159/309] Compiling C object utils/keytable/ir-keytable.p/ir-encode.c.o
[160/309] Linking target utils/cec-ctl/cec-ctl
[161/309] Compiling C object utils/keytable/ir-keytable.p/keymap.c.o
[162/309] Compiling C object utils/ivtv-ctl/ivtv-ctl.p/ivtv-ctl.c.o
[163/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-base-block.cpp.o
[164/309] Linking target utils/ivtv-ctl/ivtv-ctl
[165/309] Generating symbol file lib/libv4l1/libv4l1.so.0.0.0.p/libv4l1.so.0.0.0.symbols
[166/309] Linking target lib/libv4l1/v4l1compat.so
[167/309] Compiling C object utils/ir-ctl/ir-ctl.p/toml.c.o
[168/309] Linking target utils/ir-ctl/ir-ctl
[169/309] Compiling C object utils/media-ctl/media-ctl.p/options.c.o
[170/309] Compiling C object utils/media-ctl/libmediactl.a.p/libmediactl.c.o
[171/309] Generating utils/qv4l2/qt5-qv4l2_qrc with a custom command
[172/309] Generating 'utils/qv4l2/qv4l2.p/moc_qv4l2.cpp'.
[173/309] Linking static target utils/media-ctl/libmediactl.a
[174/309] Generating 'utils/qv4l2/qv4l2.p/moc_general-tab.cpp'.
[175/309] Generating 'utils/qv4l2/qv4l2.p/moc_vbi-tab.cpp'.
[176/309] Generating 'utils/qv4l2/qv4l2.p/moc_capture-win.cpp'.
[177/309] Compiling C object utils/media-ctl/media-ctl.p/media-ctl.c.o
[178/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_.._qt5-qv4l2_qrc.cpp.o
[179/309] Compiling C object utils/media-ctl/libv4l2subdev.a.p/libv4l2subdev.c.o
[180/309] Linking static target utils/media-ctl/libv4l2subdev.a
[181/309] Compiling C object utils/keytable/ir-keytable.p/toml.c.o
[182/309] Linking target utils/media-ctl/media-ctl
[183/309] Compiling C object utils/keytable/ir-keytable.p/keytable.c.o
[184/309] Linking target utils/keytable/ir-keytable
[185/309] Compiling C++ object utils/edid-decode/edid-decode.p/edid-decode.cpp.o
[186/309] Compiling C object utils/qv4l2/qv4l2.p/alsa_stream.c.o
[187/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-cta-block.cpp.o
[188/309] Compiling C++ object utils/edid-decode/edid-decode.p/parse-displayid-block.cpp.o
[189/309] Linking target utils/edid-decode/edid-decode
[190/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_qv4l2.cpp.o
[191/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_capture-win.cpp.o
[192/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_vbi-tab.cpp.o
[193/309] Compiling C object utils/qv4l2/qv4l2.p/v4l2-tpg-colors.c.o
[194/309] Compiling C++ object utils/qv4l2/qv4l2.p/raw2sliced.cpp.o
[195/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win-qt.cpp.o
[196/309] Generating utils/qvidcap/qt5-qvidcap_qrc with a custom command
[197/309] Compiling C++ object utils/qv4l2/qv4l2.p/meson-generated_moc_general-tab.cpp.o
[198/309] Compiling C++ object utils/qvidcap/qvidcap.p/meson-generated_.._qt5-qvidcap_qrc.cpp.o
[199/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win.cpp.o
[200/309] Generating 'utils/qvidcap/qvidcap.p/moc_capture.cpp'.
[201/309] Compiling C object utils/qvidcap/qvidcap.p/codec-fwht.c.o
[202/309] Compiling C object utils/qv4l2/qv4l2.p/v4l2-tpg-core.c.o
[203/309] Compiling C object utils/qvidcap/qvidcap.p/codec-v4l2-fwht.c.o
[204/309] Compiling C++ object utils/qv4l2/qv4l2.p/vbi-tab.cpp.o
[205/309] Compiling C++ object utils/qv4l2/qv4l2.p/ctrl-tab.cpp.o
[206/309] Compiling C object utils/qvidcap/qvidcap.p/v4l-stream.c.o
[207/309] Compiling C++ object utils/qvidcap/qvidcap.p/meson-generated_moc_capture.cpp.o
[208/309] Compiling C object utils/qvidcap/qvidcap.p/v4l2-tpg-colors.c.o
[209/309] Compiling C++ object utils/qv4l2/qv4l2.p/capture-win-gl.cpp.o
[210/309] Compiling C++ object utils/qv4l2/qv4l2.p/general-tab.cpp.o
[211/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-fwht.c.o
[212/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/codec-v4l2-fwht.c.o
[213/309] Compiling C++ object utils/qvidcap/qvidcap.p/v4l2-info.cpp.o
[214/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l-stream.c.o
[215/309] Compiling C++ object utils/qv4l2/qv4l2.p/tpg-tab.cpp.o
[216/309] Compiling C object utils/qvidcap/qvidcap.p/v4l2-tpg-core.c.o
[217/309] Compiling C++ object utils/rds-ctl/rds-ctl.p/v4l2-info.cpp.o
[218/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-io.cpp.o
[219/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-meta.cpp.o
[220/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-edid.cpp.o
[221/309] Compiling C++ object utils/qvidcap/qvidcap.p/capture.cpp.o
[222/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/media-info.cpp.o
[223/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-modes.cpp.o
[224/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-misc.cpp.o
[225/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-sdr.cpp.o
[226/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-selection.cpp.o
[227/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-overlay.cpp.o
[228/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-stds.cpp.o
[229/309] Compiling C++ object utils/qvidcap/qvidcap.p/paint.cpp.o
[230/309] Compiling C++ object utils/rds-ctl/rds-ctl.p/rds-ctl.cpp.o
[231/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vbi.cpp.o
[232/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-subdev.cpp.o
[233/309] Linking target utils/rds-ctl/rds-ctl
[234/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-tuner.cpp.o
[235/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-colors.c.o
[236/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidcap.cpp.o
[237/309] Compiling C++ object utils/qvidcap/qvidcap.p/qvidcap.cpp.o
[238/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-vidout.cpp.o
[239/309] Compiling C object utils/v4l2-sysfs-path/v4l2-sysfs-path.p/v4l2-sysfs-path.c.o
[240/309] Linking target utils/v4l2-sysfs-path/v4l2-sysfs-path
[241/309] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-dbg.cpp.o
[242/309] Compiling C object utils/v4l2-ctl/v4l2-ctl.p/v4l2-tpg-core.c.o
[243/309] Linking target utils/qvidcap/qvidcap
[244/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl.cpp.o
[245/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-common.cpp.o
[246/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-info.cpp.o
[247/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-fuzzing.cpp.o
[248/309] Compiling C++ object utils/qv4l2/qv4l2.p/qv4l2.cpp.o
[249/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-compliance.cpp.o
[250/309] Linking target utils/qv4l2/qv4l2
[251/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-power.cpp.o
[252/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-audio.cpp.o
[253/309] Compiling C++ object utils/v4l2-ctl/v4l2-ctl.p/v4l2-ctl-streaming.cpp.o
[254/309] Linking target utils/v4l2-ctl/v4l2-ctl
[255/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-tuner-record-timer.cpp.o
[256/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/media-info.cpp.o
[257/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-codecs.cpp.o
[258/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-debug.cpp.o
[259/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test.cpp.o
[260/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-colors.cpp.o
[261/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-info.cpp.o
[262/309] Compiling C++ object utils/cec-compliance/cec-compliance.p/cec-test-adapter.cpp.o
[263/309] Compiling C++ object utils/v4l2-dbg/v4l2-dbg.p/v4l2-info.cpp.o
[264/309] Linking target utils/v4l2-dbg/v4l2-dbg
[265/309] Linking target utils/cec-compliance/cec-compliance
[266/309] Compiling C object contrib/test/ioctl-test.p/ioctl-test.c.o
[267/309] Linking target contrib/test/ioctl-test
[268/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-time32-64.cpp.o
[269/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-controls.cpp.o
[270/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-io-config.cpp.o
[271/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-compliance.cpp.o
[272/309] Compiling C object contrib/test/sliced-vbi-test.p/sliced-vbi-test.c.o
[273/309] Compiling C object contrib/test/sliced-vbi-detect.p/sliced-vbi-detect.c.o
[274/309] Linking target contrib/test/sliced-vbi-test
[275/309] Linking target contrib/test/sliced-vbi-detect
[276/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-subdevs.cpp.o
[277/309] Compiling C object contrib/test/driver-test.p/driver-test.c.o
[278/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-input-output.cpp.o
[279/309] Linking target contrib/test/driver-test
[280/309] Compiling C object contrib/test/stress-buffer.p/stress-buffer.c.o
[281/309] Linking target contrib/test/stress-buffer
[282/309] Compiling C object contrib/test/capture-example.p/capture-example.c.o
[283/309] Linking target contrib/test/capture-example
[284/309] Compiling C object contrib/test/v4l2gl.p/v4l2gl.c.o
[285/309] Compiling C object contrib/test/mc-nextgen-test.p/mc_nextgen_test.c.o
[286/309] Compiling C object contrib/test/v4l2grab.p/v4l2grab.c.o
[287/309] Linking target contrib/test/v4l2gl
[288/309] Linking target contrib/test/mc-nextgen-test
[289/309] Linking target contrib/test/v4l2grab
[290/309] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/standards.c.o
[291/309] Compiling C object contrib/test/pixfmt-test.p/pixfmt-test.c.o
[292/309] Compiling C object contrib/rds-saa6588/rds-saa6588.p/rds-saa6588.c.o
[293/309] Linking target contrib/rds-saa6588/rds-saa6588
[294/309] Compiling C object contrib/decode_tm6000/decode_tm6000.p/decode_tm6000.c.o
[295/309] Linking target contrib/test/pixfmt-test
[296/309] Compiling C object contrib/xc3028-firmware/xc3028-firmware.p/firmware-tool.c.o
[297/309] Linking target contrib/decode_tm6000/decode_tm6000
[298/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-formats.cpp.o
[299/309] Linking target contrib/xc3028-firmware/xc3028-firmware
[300/309] Compiling C object contrib/gconv/EN300-468-TAB00.so.p/en300-468-tab00.c.o
[301/309] Linking target contrib/gconv/EN300-468-TAB00.so
[302/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-media.cpp.o
[303/309] Compiling C object contrib/test/sdlcam.p/sdlcam.c.o
[304/309] Compiling C object contrib/gconv/ARIB-STD-B24.so.p/arib-std-b24.c.o
[305/309] Linking target contrib/gconv/ARIB-STD-B24.so
[306/309] Linking target contrib/test/sdlcam
[307/309] Generating doc/doxygen with a custom command
<https://builder.linuxtv.org/job/dtv-scan-tables/ws/v4l-utils/lib/include/libdvbv5/dvb-dev.h>:321: warning: argument 'open_dev' from the argument list of dvb_dev_get_fd has multiple @param documentation sections
[308/309] Compiling C++ object utils/v4l2-compliance/v4l2-compliance.p/v4l2-test-buffers.cpp.o
[309/309] Linking target utils/v4l2-compliance/v4l2-compliance
+ pwd
+ PATH=<https://builder.linuxtv.org/job/dtv-scan-tables/ws/build/utils/dvb/>:/usr/lib/ccache:/var/lib/jenkins/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/games make
ERROR value 7/9 is invalid for INNER_FEC while parsing line 44 of dvb-s/Badr-4-26.0E
Error reading file dvb-s/Badr-4-26.0E
Reading file dvb-s/Badr-4-26.0E
ERROR value 1/4 is invalid for INNER_FEC while parsing line 63 of dvb-s/Eutelsat-10A-12.0W
Error reading file dvb-s/Eutelsat-10A-12.0W
Reading file dvb-s/Eutelsat-10A-12.0W
ERROR value 1/4 is invalid for INNER_FEC while parsing line 72 of dvb-s/Eutelsat-36B-50.5E
Error reading file dvb-s/Eutelsat-36B-50.5E
Reading file dvb-s/Eutelsat-36B-50.5E
ERROR value 1/4 is invalid for INNER_FEC while parsing line 55 of dvb-s/Eutelsat-21B-21.6E
Error reading file dvb-s/Eutelsat-21B-21.6E
Reading file dvb-s/Eutelsat-21B-21.6E
make: *** [Makefile:49: dvbv3/dvb-s/Badr-4-26.0E] Error 255
make: *** Waiting for unfinished jobs....
make: *** [Makefile:49: dvbv3/dvb-s/Eutelsat-10A-12.0W] Error 255
make: *** [Makefile:49: dvbv3/dvb-s/Eutelsat-21B-21.6E] Error 255
make: *** [Makefile:50: dvbv3/dvb-s/Eutelsat-36B-50.5E] Error 255
ERROR value 1/4 is invalid for INNER_FEC while parsing line 45 of dvb-s/Eutelsat-36D-36.0E
Error reading file dvb-s/Eutelsat-36D-36.0E
Reading file dvb-s/Eutelsat-36D-36.0E
make: *** [Makefile:50: dvbv3/dvb-s/Eutelsat-36D-36.0E] Error 255
ERROR value 1/4 is invalid for INNER_FEC while parsing line 242 of dvb-s/Eutelsat-3B-3.0E
Error reading file dvb-s/Eutelsat-3B-3.0E
Reading file dvb-s/Eutelsat-3B-3.0E
make: *** [Makefile:50: dvbv3/dvb-s/Eutelsat-3B-3.0E] Error 255
Build step 'Execute shell' marked build as failure


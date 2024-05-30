Return-Path: <linux-media+bounces-12229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A78D4A1D
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 13:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94E13B2403A
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0517116F282;
	Thu, 30 May 2024 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="lzWOSDSL"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620B76F30C
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067664; cv=pass; b=e9qCu8pUD+2t3DibaoLqvmH3VebH1DBJpCHDKbvDPwvcTGevcxqQs7WaqerIqEtUTCptJVM4fkVmvCNuaUYdHjdSodZWul4vNuSW+maQ0ELJL8oZCExQmTJmuF2WF8XyQUAQegani21kf6Wo4AfywK4MCNphQ+L8Ic7k9JXXjzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067664; c=relaxed/simple;
	bh=I2ofDMWhfhMz26JegxXHUvDUfxdJXbbUhTTXPq5a/L4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezyQclcMEzlsXX5jMTclRLcd1h5dPFOPoMZ4iQSdhhaBzeup+cYgDFlgFPwo1dthRrAAE3bjDTwqy9rule7jZRpbccPARFmc9u655EOhZuab4cIeZVNKknvwLnrirun+GTPMsVNRZnrVG4A/cJR7T19mFbF4JcKIoAiD7raM4rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=lzWOSDSL; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VqkCt4QdMz49Q3r;
	Thu, 30 May 2024 14:14:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1717067658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=yLSDtnAOpB99dDyR9umiwei52fSGdQK1594wdz5Udb8=;
	b=lzWOSDSLE0OFiAOGviBuSKnYM69aVl15OkJo41+x3ruQI9qv55SmbFm5MRJyT519/ANXNj
	3K6JMpdMV5VUu1iWwR6yD6OBPpRnyIHuVgXBJqq9om81dUwUvFUyGbqE2DwA5Ib9/tFDc5
	5LH6C0DNVjIPX5evfALLFn0HPXZHJE9/KUcz2IzGz6LAoe7u+CjuecgB+1n5cwFnOzVrnc
	vgB1jIweqNyRnRyYaJzT3H84JUo4oH+EsHOctezWhAuDX9jB5O2OKN+/eWXGcfU+Ztow+T
	VV0KD2D6AayJPtdbYxjfvi9uF2q3ZeIs+eIN2wsPk2ykAQ90oUEYg9aVttUzKQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1717067658; a=rsa-sha256;
	cv=none;
	b=LP0NYtApVBat+6ojqfEjPCc4PQGZxqfnz61Bse3KUUuMnBVA55tVPz64/E7YpHZuXhqMpr
	+HC0iiO8UxH1lNMdjVmnbTV7pQyTie3sK1/951DO/5TWj+keoplobofwFnIgq8Sv1ZR54c
	HfwG7LNQsaDE23S8SMAZBdxNzpyTC6JE3b8CJYJbqkIo0ZcMA7pY9bKz8CAJUHMdQMKuWI
	5XKNfzcr2Ey9ygdm2++1Jaz77VikkEqJEDCg4LOF+KlQllY6mqjeuyA7as/bQDXWx5NoO2
	Jiy9bUY4vXB8Ec1+gDl73mOjjTFJI6WZUXh51m/NEvH2/mNyaEU8nrbE2uceWw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1717067658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=yLSDtnAOpB99dDyR9umiwei52fSGdQK1594wdz5Udb8=;
	b=wOIWdzGFXqN6eFTBm97FGCeVz33+WPZfxi1w8orFO8J+RhVZV9pemJc7eZCj09mMPI5R3V
	Co5IefawBHvgmWkRnK06791Is8mrsMoYftNhThrkgnHVcs6pwcAKKSA2w1AODLt5McTpA3
	jgcbkjhXIw3V22lGvFvIdPvHPc4UaarKAcTAaajKVe3uDGlmjyknoMRfQFjwPx9veMK3/B
	QR9Ep3U2on0xwSP03yunVf7Ne23Qr7g7C+lHdy7akttgsmrdG6uHn+Q4bdD22XjoZDusOJ
	OIDIABfNSyBzYI5+VlAsfRf116hKI5vn1FJkCSTdpwLghSMciuyel0/Lfpnkow==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 65041634C93;
	Thu, 30 May 2024 14:11:09 +0300 (EEST)
Date: Thu, 30 May 2024 11:11:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR 6.10] MEI and IPU6 fixes
Message-ID: <ZlhezeUcpAj_0YoV@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are two fixes for both IPU6 and MEI CSI drivers.

Please pull.


The following changes since commit c19fa08c1414644b0d9275d336bdaff90af57d0b:

  media: intel/ipu6: fix the buffer flags caused by wrong parentheses (2024-05-28 08:00:14 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-4-signed

for you to fetch changes up to 00c7e9cfa47ab23f947729cbfb67ba3829c671bf:

  media: intel/ipu6: add csi2 port sanity check in notifier bound (2024-05-30 14:05:51 +0300)

----------------------------------------------------------------
MEI and IPU6 fixes for 6.10

----------------------------------------------------------------
Bingbu Cao (2):
      media: intel/ipu6: update the maximum supported csi2 port number to 6
      media: intel/ipu6: add csi2 port sanity check in notifier bound

Sakari Ailus (2):
      media: mei: csi: Put the IPU device reference
      media: mei: csi: Warn less verbosely of a missing device fwnode

 drivers/media/pci/intel/ipu6/ipu6-isys.c | 6 ++++++
 drivers/media/pci/intel/ipu6/ipu6.c      | 2 +-
 drivers/media/pci/intel/ivsc/mei_csi.c   | 5 ++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
Kind regards,

Sakari Ailus


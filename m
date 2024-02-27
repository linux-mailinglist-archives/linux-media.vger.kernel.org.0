Return-Path: <linux-media+bounces-6014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 161AA868BB6
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 10:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474591C221B0
	for <lists+linux-media@lfdr.de>; Tue, 27 Feb 2024 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2305136646;
	Tue, 27 Feb 2024 09:08:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from deferred-out-02.cmp.livemail.co.uk (deferred-out-02.cmp.livemail.co.uk [213.171.216.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A371332AA
	for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.171.216.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024900; cv=none; b=CzPNODxeq0GPioJYuwyKQfBu00sF0h+eVkSo5a3xQGzHw6kNqWe0XmFuOovrRS8Y19h9khTT5W5QQsLB9veDvfbWGWWRLHvTKGPftBNzaqXZqifwsLrRoGee18gdXmbSD8oIfhSrzKIevgX9wFDQ3wU4jfm3T9cVPUTNywTW7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024900; c=relaxed/simple;
	bh=5XDFEAofdvV3OrP7fK8uF9N+iIrPJGeTzkOO6G/x2Gg=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=g8hCJbAtVZKQgZ7osIYIWPQ1AUUgiONNgAwvSE6QdG4In99KoBP09jQ8H+tr9EyZgbYAVdxL1O6TnRsHbwBmGsjLS8UtRxmgoqT5ap0U8/IQbCvTMqNgYLG8SpzmzFMwJm5Nm+6Lh5Ifm0EL42IN4PmAiOLJEHH1ajAzjqYRjUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coochey.net; spf=pass smtp.mailfrom=coochey.net; arc=none smtp.client-ip=213.171.216.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coochey.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coochey.net
Received: from localhost (unknown [127.0.0.1])
	by deferred-out-02.cmp.livemail.co.uk (Postfix) with ESMTP id 73DA8CE12F
	for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 09:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at deferred-out-02.cmp.livemail.co.uk
Received: from deferred-out-02.cmp.livemail.co.uk ([127.0.0.1])
	by localhost (deferred-out-02.cmp.livemail.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37bM1wCsYZtY for <linux-media@vger.kernel.org>;
	Tue, 27 Feb 2024 09:02:41 +0000 (GMT)
Received: from smtp.livemail.co.uk (smtp-auth-out-01.cmp.livemail.co.uk [10.44.166.50])
	by deferred-out-02.cmp.livemail.co.uk (Postfix) with ESMTP id BC093CE0E7
	for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 09:02:41 +0000 (GMT)
Received: from [172.21.2.71] (firewall.coochey.net [51.148.177.198])
	(Authenticated sender: giles@coochey.net)
	by smtp.livemail.co.uk (Postfix) with ESMTPSA id 76A90CBE77
	for <linux-media@vger.kernel.org>; Tue, 27 Feb 2024 09:00:15 +0000 (GMT)
Content-Type: multipart/mixed; boundary="------------Nv9yNvY28pmJbLcK0ulLotn0"
Message-ID: <476e98e9-42d3-491c-bb9d-785c2d76bf7f@coochey.net>
Date: Tue, 27 Feb 2024 09:00:13 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: linux-media@vger.kernel.org
From: Giles Coochey <giles@coochey.net>
Subject: dvb-scan-tables uk-BeaconHill update

This is a multi-part message in MIME format.
--------------Nv9yNvY28pmJbLcK0ulLotn0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

As per https://en.wikipedia.org/wiki/Beacon_Hill_transmitting_station


--------------Nv9yNvY28pmJbLcK0ulLotn0
Content-Type: text/plain; charset=windows-1252; name="uk-BeaconHill"
Content-Disposition: attachment; filename="uk-BeaconHill"
Content-Transfer-Encoding: 8bit

#----------------------------------------------------------------------------------------------
# Auto-generated from:
# <http://www.digitaluk.co.uk/coveragechecker/main/tradeexport/TQ3 1RT/NA/0/>
#----------------------------------------------------------------------------------------------
# location and provider: UK, Beacon Hill
# date (yyyy-mm-dd)    : 2015-01-17
#
#----------------------------------------------------------------------------------------------
[C60- BBC A]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 658000000
	BANDWIDTH_HZ = 8000000
	CODE_RATE_HP = 2/3
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/32
	HIERARCHY = NONE
	INVERSION = AUTO

[C53+ D3&4]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 634000000
	BANDWIDTH_HZ = 8000000
	CODE_RATE_HP = 2/3
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/32
	HIERARCHY = NONE
	INVERSION = AUTO

[C33 COM7 HD]
	DELIVERY_SYSTEM = DVBT2
	FREQUENCY = 570000000
	BANDWIDTH_HZ = 8000000
	CODE_RATE_HP = 2/3
	CODE_RATE_LP = NONE
	MODULATION = QAM/256
	TRANSMISSION_MODE = 32K
	GUARD_INTERVAL = 1/128
	HIERARCHY = NONE
	STREAM_ID = 0
	INVERSION = AUTO

[C42 SDN]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 642000000
	BANDWIDTH_HZ = 8000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/32
	HIERARCHY = NONE
	INVERSION = AUTO

[C45 ARQ A]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 666000000
	BANDWIDTH_HZ = 8000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/32
	HIERARCHY = NONE
	INVERSION = AUTO

[C51 ARQ B]
	DELIVERY_SYSTEM = DVBT
	FREQUENCY = 626000000
	BANDWIDTH_HZ = 8000000
	CODE_RATE_HP = 3/4
	CODE_RATE_LP = NONE
	MODULATION = QAM/64
	TRANSMISSION_MODE = 8K
	GUARD_INTERVAL = 1/32
	HIERARCHY = NONE
	INVERSION = AUTO

[C57+ BBC B HD]
	DELIVERY_SYSTEM = DVBT2
	FREQUENCY = 682000000
	BANDWIDTH_HZ = 8000000
	CODE_RATE_HP = 2/3
	CODE_RATE_LP = NONE
	MODULATION = QAM/256
	TRANSMISSION_MODE = 32K
	GUARD_INTERVAL = 1/128
	HIERARCHY = NONE
	STREAM_ID = 0
	INVERSION = AUTO


--------------Nv9yNvY28pmJbLcK0ulLotn0--


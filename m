Return-Path: <linux-media+bounces-12563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D578FC4E0
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 09:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 210EE1F253AB
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 07:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4FF18C34D;
	Wed,  5 Jun 2024 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="upUN4XZV"
X-Original-To: linux-media@vger.kernel.org
Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29EBF9D9
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573516; cv=fail; b=K9Zz0bJq52f5iT4CZQ8YqpKecgGVqGduHhyJxRGSWwvZ3AzUIwfMWnxhbCYgkfiYRLAvma3058aZNvPgCuGWkZjGcm9nJ/Ajv3TmltREtQcTeh6eqljVGYpCUjG4MuKwKcTql/SMJkcus2Mj6FV1OVYmqWOrDCB0/mATFRn5e1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573516; c=relaxed/simple;
	bh=t0XsweaRH70cEaR2TqwaEX3BX2CKzr+/7yoxLxLCSro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t//S68H+FWLJ0Neooj9buBFKg9PeqoAcwzade8EQgsfmeaIkPsIz3+Oyf3dE+3iGb1OauNM32CtM6NVnaA3EN2F6PUaa/hyDUVFyHDkOTm5RTrqX/q+b0eqV+allpA0iAFQjhxkQGRSes8mu2Q7tVo9RPb9oucW3SZeIOargXa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=upUN4XZV; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.19.48])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 76512100F25CF
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 07:45:12 +0000 (UTC)
Received: from 104.47.11.168_.trendmicro.com (unknown [172.21.191.80])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 7F45F10001359;
	Wed,  5 Jun 2024 07:45:03 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1717573500.539000
X-TM-MAIL-UUID: a1eed563-f946-4527-beb3-a9b80fd9a6ef
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 83C731000030E;
	Wed,  5 Jun 2024 07:45:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTuVlZyqP5rb8+yWhVrku2tVa1CskqMsFAfX2+kRNrTyU6i4tlpiE6n6poss3kVlZRGEw9zJvszA/dl/E65RzGvcoahs1PiUxOob9DRdU33AHG7H4QtCmPVotJe9iDLbMz+lfGnsVxfR228Q43XC8MLcKf4efAfuAIbxLH04JbZtPESYiYhzqmvuILDtnY9NNU8SAieMBL+qUrf6z70Esg+B4eZ0SRLMRnti4vaqaLn2G9odHmJ2UKqWxBrfIsSCLg3n1wVcFWSgGlj4gMUcAL8lHQS8JVult8P87aaM49LOfTz284Z96p9Me0RKrZ7fbrIY02nN0ufxh9Fm+Byofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=druXbZzgAFwMTintMsbDQXyRuVhVfvUIMFny1/Izy+0=;
 b=WXGVBaSAI7kk5+i6soq/GqmoRhsfj6wBZwyTkMi8hsFuGaFFv9sm7erfGPF3gZId8eKqri9se7N7RIEJ2rIkcw8hRJo0AEC510V20GomWAnAdAwMsF3jEUMcXzb9pK5iGBNrDjGrZM8OFBhTg5ZElhufjv8l5IWTnZ+JSpDm600RfN7oBwSCeL51s0LELdLF3Ea4fX+eLN2oM83l9DcPLlcseUVn9+affvnxKxxoh35sSq+Pg/OkQAp8JJsAGR9jSDuIJqv/MRzIDVJNMa4Tj/N0wvwS3m7bu8Qbmo7UHMmjuYa7nsOkQxarAtDb7Pz1TDAHllM0GvRQxckU9XutIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=chromium.org smtp.mailfrom=opensynergy.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensynergy.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Alexander Gordeev <alexander.gordeev@opensynergy.com>,
	Albert Esteve <aesteve@redhat.com>,
	Alexandre Courbot <acourbot@chromium.org>,
	alex.bennee@linaro.org,
	Andrew Gazizov <andrew.gazizov@opensynergy.com>,
	Andrii Cherniavskyi <andrii.cherniavskyi@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Enric Balletbo i Serra <eballetb@redhat.com>,
	Enrico Granata <egranata@google.com>,
	Gustavo Padovan <gustavo.padovan@collabora.com>,
	Keiichi Watanabe <keiichiw@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Marcin Wojtas <mwojtas@google.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Matti.Moell@opensynergy.com,
	bag@semihalf.com,
	bgrzesik@google.com,
	hmazur@google.com,
	mikrawczyk@google.com,
	srosek@google.com,
	zyta@google.com,
	linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Subject: [PATCH v9 RESEND 0/1] Virtio video device specification
Date: Wed,  5 Jun 2024 09:42:37 +0200
Message-ID: <20240605074239.124473-1-alexander.gordeev@opensynergy.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000191:EE_|FR3P281MB2032:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d8239ffe-c624-4a58-6e93-08dc85336643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tl84jAHqsME4BsXvhFHu6rb6bk1bJ2udMW9B1efnFOCEL2EWJU2e7XovyKsF?=
 =?us-ascii?Q?XBqXHNOgVVZ57+UcWQBNasv76ph5QSekJSJUXZ9c5uy4NldBPTeBZh3yYFWK?=
 =?us-ascii?Q?6u63KnOb68bWlIDT74A6GiAbjcXnKzZ4NTrvXEhW8r/3RlEiqZRto/tvKPt3?=
 =?us-ascii?Q?JCg+qXEJ0JeI0cH8tb5Ragkm6CG3hoFLfyumyN7iTCM6VIeu79duVb+IjKez?=
 =?us-ascii?Q?3bR9+QWnRIgd3yAnUyS+vrUlNdZtfpi+CmL7bLPzPLo6JlFKoPuhTunVRkwt?=
 =?us-ascii?Q?S552b00B/Ct3HANcVmsh/vmpSma87cHEQ/rKeQiswLOOv5yHj5ctsu6amXJb?=
 =?us-ascii?Q?RSJUpBwV/9feDSe2MrGOCVJ1VSHRC9M1j5zdFsi53FHCMGI5u46oyimNT+n2?=
 =?us-ascii?Q?kZMVwYdTsHZ8xRk6fdomKTnAWjoti/SgcR+YYKwi1XC/ExWnf8MRCc1wYGWP?=
 =?us-ascii?Q?vEKA9BZL6q3D6TwutDWnhLJXtKHTiGFMkBW33ZNEufRh3gve+nkwwYAWycqz?=
 =?us-ascii?Q?qCcZCngD9vrFAMy2t6TNw4fwI2Hm9atYj+76SfOp3DZPSpXb4vkiPX4hDzzE?=
 =?us-ascii?Q?BCCjzPwJHpnHJ13fE6nDnhMiIVnf0a80hRYqj078QLwHOYNweD/ZZDEegYTO?=
 =?us-ascii?Q?5vwjR9yE6u7ilEZvSbTR1j07t5HSH+QD6a1BT7PzwVAEDPi0TZxOkgpoH7Ep?=
 =?us-ascii?Q?evGd5MbZHNy+XQUSFKZbNe+W9RJQMGKi8rYKujFSIi9foIuozGzSq3GH59z9?=
 =?us-ascii?Q?HEheOIdFXHZWsGTwWm8KbcHL14XDs41+GJPYicu3sOV4jXvQJIdd3krKYMrW?=
 =?us-ascii?Q?3KFlDcmJhWB7mGOc78gpPvN0RdQ9A/LB9ER4I25L/cCKsbVwSmcjVpY9EbTH?=
 =?us-ascii?Q?yFq3Jj1NXizhDyz/shbQ0lYVQUraLW7OJuaH1vw9CzYReBohfEjd/SPksNP3?=
 =?us-ascii?Q?4r1wG0X5QY7fZPupuYby/6r4feWvtTjKgfmAef3orD6mFC/01TM0btlGHetr?=
 =?us-ascii?Q?GpQ4UGGEd2JnpErp4eiekfjTCIiYPBjfYnuSXe46iIYD/1X0rjK/pjtxDmuR?=
 =?us-ascii?Q?enaNM3K00MqUYtQYdvLDUJdMocZraJ5RGgxPCSpuP1t6Es6n8r45uVbUzR37?=
 =?us-ascii?Q?vcwMSFMGxZA7ZhqAt8rQHeHqCI7KtHvQQXYjVqVbQPSus6aLEWEg40T+022/?=
 =?us-ascii?Q?yhohfwuLP7AMtIkKBqYTKME5zTH0fJc0CxIdLygepO2Yurq8utE0dsi72Kqo?=
 =?us-ascii?Q?IixdWAN5iPBLB0xejXZ2YO8GLq63yS8mvW2eXxq0OS15h66kB8Fa2AfZ5DjE?=
 =?us-ascii?Q?aIOOQ87FGnNg7Q0diATIUxHpLyK5mX6FTaUnspmENfqrCGMkS1I1EySiCsW2?=
 =?us-ascii?Q?zyH3EkI=3D?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(7416005)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 07:44:58.4351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8239ffe-c624-4a58-6e93-08dc85336643
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2032
X-TM-AS-ERS: 104.47.11.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28432.006
X-TMASE-Result: 10--18.460000-4.000000
X-TMASE-MatchedRID: FQo/JhuHF01KqT77NMMyN9EZ3jNruZrPZK1SF2R3ediy2KcDnJPR2XoX
	Wf28Kt1WdBjoMEPmPfi4mrHlZ16ONzQOHX12tkoi3OA9wrs0AD0+qCvrVHMYXpdigZi17dHqKEc
	Mx3BrCStrYq2UPKuEJOM2l0V4Su7rvZyVfZrc6N0XS7bM7P8iGBwr5LLKUXeOAmBhgdYLTDl60T
	dQ4dbnIViHN7fEaLXimpAhENEYk4AUFGYAqJTuAN2crNR8miTUuFC97///te3wAvl+I1avDlx+v
	LNot6+N+jiazyZ0t6elhmaIAUBOfmApfV6+GEd91dB1lEL6QMWYTLT8orMAmvbVsYZL/jhxpxEL
	22llsI1xBRXqBjzwZexP6Kr0mf7VBFEtfDmPmh7qSee/BbggGouvcKpGSDPplueiTveeZGAQqh1
	sQnJrF6siUpUJTGC8qQZD6eM5ZgcvjfwOm5+mTyQptwyVJHc8iZ5bcWVVE8BlyOnJ/nFmK4jLwL
	OSKb1E9Rm8WOY/tYVFBMIZlJa6b94rBdptIjsnFvggL5qqxd3OKm7oAxeFFc8NEee6WY0AM/UMu
	PjMqqPgSyTPYV+ByUF2JfNJT/5/wBDfgAwffVNGDXkz8A7dj4M+VZimfMfO4KNHhzFHuJkMwqLs
	3yWGdlza06ypXO1yqonS1IlGcFZ93ocDP/yHSKqJbIe5fXLQn8cUfSHIwCASCDdzAMeX/fzilCV
	SnD5IkFhIDewwGPmN4P4XksxlVzv5gdvtdpzVWjsaYI4lh3UCpgETeT0ynA==
X-TMASE-XGENCLOUD: 3c483fa2-fdd2-483f-8fdf-a8b7a412a736-0-0-200-0
X-TM-Deliver-Signature: CEE89DF92F06FA79E92AA590A8DBCFB6
X-TM-Addin-Auth: STjWwopncTBjGTlYBemdnQaSgsdTseMKAJKz8gu3B2j7zrn+RE3KBS0d3gB
	vVSrGWKvqHERhbzqVgbo1HTf6zXTY8CIewrTl2hj9vx0IO/flDgEisOxDxxmXAYjgSKmHMgyrXW
	vMki3FuKVuUsd/3UhRrvZ2k5Xx3ug7KV3KsSZ+MWoomLN7D5h2CqA5EYkHU0gj3Laps1Jz2bqK1
	+NiYSgU+u6jYCK3H0DgM9K0l6LgQfO5DE01G25sfY4tAqAX96vWg0mXcPPZrMTVx/GqU24awaRc
	aCcHNCKTRPk3fmlL6UX24xdzQ6OQ3onc6mgR.EWROgy3lDY7Go3it1n4MvZ1Vsj4R+0Aza6dSGW
	KMNwMnUMOAyQ5Vsj6lWvVwb4OIyXd/3TdkSw5vsU1jFQZvE5fOEeLdZIEecVWArLCjej3nMRMB6
	4b8AS/jeugQTdaoYmuMQUb98WD0V/ZRYCbxTiBl2E4MF5up8GQpL5fPJ/zbn7ZV4ywCUl09cZld
	FxkcFPLgpesPRen0zyYFe+EV9fsKXgZ0x68TXmOl0OzSvM34WWT5xE5bwVpH82NZD5Kg80xu/xn
	lU9EpqiW7sx/Xbbr5SAw2mdKv2JTmT5q53JxsDlzgSTFTjDCoQ1aG1Go7JxdjjRLyU8zxfht9rW
	qnWQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1717573503;
	bh=t0XsweaRH70cEaR2TqwaEX3BX2CKzr+/7yoxLxLCSro=; l=4998;
	h=From:To:Date;
	b=upUN4XZV3PNJDp3McAfH5bblngfipXVJxSozyQEk0iPz7WNZg6ErJpgJXbL9gdbdc
	 t773VKPiPkVVra6VeATAa3yQ0L4Jeg5oFl0nqCMXbt2t+jaYiifbaSme18SAvraaos
	 r55FNUgl+yCvNFClgBmaOWhHoFkFtA7VRbx51mpwCum2gEhkWLbifP8RiywlIz8W1+
	 ZAbRqA1vjBFmhMVlXqE9nkgJeZldT1KIC2fuG1SqYfnRp6vCtVLOd+iP3qGdeDUEyX
	 zICSUbIjbH8BrU/+EZFeW3QYKZsWH/oX+TTjEN39E4Pk2g3TIe3zR5NBCuqcSEVQw/
	 HEsUEf3Mqctng==

Hi,

Update 05.06.2024:
I'm resending the patch because now the virtio mailing lists seem to be
functional again. This time without the RFC mark. I think it is already
good enough for merging. I'm working on updating the implementation. If
there are any minor changes necessary, we still have a lot of time
before the next release to fix them.

This is the 9th version of virtio-video device patch. There are some
major changes and now I think it is good enough conceptually, but may
need a few minor changes, when the driver gets updated. Sorry, it took
way longer, than I expected. There are a lot of details to care about
and also a lot of distractions. Please review.

Changelog v8 -> v9:
1. Chenged representation of device capabilities/parameters to
Type-Length-Value (TLV).
TLV representation is already used in the kernel, see [1][2]. It is
mentioned in the virtio sound device specification. It is also
compatible with struct v4l2_ext_control, that is used to set V4L2
controls in batches. Here I'm trying to extend the approach onto many
other things: device capabilities, formats, buffers/resources, crop
settings. This way it is possible to get all the device capabilities in
one call, then set all the parameters/controls in one call. For us this
is important due to significant hypercall delays. I hope this might be
applicable in the V4L2 core as well in the future, so I'm very
interested in comments from linux-media community.

2. Changed back the representation of capabilities to pre v7 model.
Video decoders and encoders are basically converters between
multidimensional shapes of all supported encoded formats and all
supported raw formats. This was roughly the way the capabilities were
represented in v1-v6 (excluding the controls), then in v7 and v8 I
tried to do it closer to the V4L2 discovery process. Now I think this
was a mistake, the previously used method may look more complex, but it
fits better. This approach is similar to the way the capabilities are
described in gstreamer (they don't seem to have explicit links between
the sets though).

3. Replaced the internal device's per stream resource queues with
virtqueues.
The idea briefly: we had to avoid blocking the descriptors for a long
time, so I implemented delayed responses in v8. Then there is no
natural limit for the number of elements in the resource queues
anymore. What to do if the queue becomes full? So there are a bunch of
things to define in the spec. I decided to replace these queues with
virtqueues, because the virtqueues are already defined well enough.
There are of course some upsides and downsides. I think upsides are
overwhelming and I'd be happy to discuss this if anyone is interested.

4. Renamed commandq to mainq since commands can be queued to per stream
queues as well.

5. Renamed STREAM_CREATE -> STREAM_OPEN, STREAM_DESTROY -> STREAM_CLOSE.
Now the per stream virtqueues are opened rather than created.

6. Enabled RESET on the output queue too.
I didn't know how to handle a VIDIOC_STREAMOFF on the capture queue
coming from guest user-space otherwise.

7. Merged ATTACH_BACKING command into SET_PARAMS.
I felt, that it really belongs to the parameters alongside the
num_resources, it allows the driver to see if the resources are detached
after a SET_PARAMS or not, also might be helpful during debugging. Still
there is an issue: SG lists can be quite large. If it is large and the
results are returned on the eventq, then this significantly increases
the eventq's descriptor sizes. Avoided this by adding a requirement for
the device to cap the TLV length to 8.

8. Added DRM format modifiers.
9. Added FWHT codec.
10. Addressed review comments.
11. The spec size went down from 24 pages to 19 pages.

Full PDF: https://drive.google.com/file/d/1gj-kOBp1uvCB5IzrtOTjf-zunP3f-EFq/view?usp=sharing
PDF with the video section only: https://drive.google.com/file/d/1fH8XaSYkwkb2beB9thS7FOvFysUM22Q5/view?usp=sharing
Please note, that external links are broken in the short version.

[1] https://docs.kernel.org/userspace-api/netlink/intro.html?highlight=tlv
[2] https://docs.kernel.org/sound/kernel-api/writing-an-alsa-driver.html?highlight=tlv
[3] https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/

Alexander Gordeev (1):
  virtio-video: Add virtio video device specification

 conformance.tex                           |    4 +
 content.tex                               |    1 +
 device-types/video/description.tex        | 1607 +++++++++++++++++++++
 device-types/video/device-conformance.tex |   22 +
 device-types/video/driver-conformance.tex |   20 +
 introduction.tex                          |   21 +
 6 files changed, 1675 insertions(+)
 create mode 100644 device-types/video/description.tex
 create mode 100644 device-types/video/device-conformance.tex
 create mode 100644 device-types/video/driver-conformance.tex

-- 
2.40.1



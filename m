Return-Path: <linux-media+bounces-6898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BEA87929C
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 12:00:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62F42B20BEA
	for <lists+linux-media@lfdr.de>; Tue, 12 Mar 2024 11:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D49C7869C;
	Tue, 12 Mar 2024 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="gdZEmqKd"
X-Original-To: linux-media@vger.kernel.org
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C27867B
	for <linux-media@vger.kernel.org>; Tue, 12 Mar 2024 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710241201; cv=fail; b=R6vrtzqZp2NqYU8iVMooq5WqzlZyeDCSVy1yTA5jAk/JDQWOm4wJH1QQg9W/+SkemFi0KhB/A1z21W8aYjRcWGQazDT+gP926gyVSytgcnYlTKuaG0snzA1Dqhq4BfyoYIkH5pTPfTZAUQ/GKkvbHhyNqs7Ftn+aD6HrB62vBEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710241201; c=relaxed/simple;
	bh=vxxP2+iaKewLGClE3Fzeah/djsRIX/5doINiMRwSrgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=roYUCfIZ5UGvS4pa6dCfhNrd3sPfOzJa0wU6TTeV5E7y6fyFlQstzd00SCyfZoRi2DA/JTs7C5VXzjw937Pm6L7b4G4XmO0Daahly73i1/ZdG5/2hEHQYFsMfsekO/JI1SLTIHtGIhL4tRE4iu1AbVoSifB06nkMLYDuab5z6hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=gdZEmqKd; arc=fail smtp.client-ip=18.185.115.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.162.72])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 1D5FE10000E3F;
	Tue, 12 Mar 2024 10:59:51 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1710241188.095000
X-TM-MAIL-UUID: da981b40-d838-41ac-96e1-632cc07132b4
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 177DD10002BAC;
	Tue, 12 Mar 2024 10:59:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2uP+sGQB5MBhxrx/zulgxPwtiEWXaCD1QDMO8xRUqJxgKeFpCkz6555c4Fl1TXre/I9SbouUpDP2jhlL2gXEtWVz/kPhz0tB1XDhkhCIUIk+hnxgPcu26eaGgEm4GIoHXatOwGPR+pDwKuEi9Qs627EY+kjC7uOIF0QvZNMZ5P8tgs6EKuLbmfuYwu7sK7isQSFvqfDOR/EpuS73DozZ2TGEOOsl93GP2stKcPNd0nT+I77W0lX9ppgDHLvopEz9isZ1osryvKyUzIW8YywGfqOtJlHU/qnp597LyxbLnehUZgaSkKB5eETInmEofBYBri+/KHXet4fO0WTS91AgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFzgbUIdZz6uNcbyByJ82Rc8jbhZER0oBBcJ17XRJuw=;
 b=TjZ1ZP/Y3YNoxDfjEginXzPVTy7V4PvLcWbSS+wfvuh6cQV57ONcBsL7JAvywIHslNboOsady/HZvadxR6QeFUx/yGKnAfJhmLrYAfR5Js+pgnBJdoeKRldsgJ/zr7D+QlN6cZtuivnbIV627AA5Fd2oKjkoZhbO3xIq3ldHPSCcQsm82V4ejLopPKFRztlq1vytgeqFWHNJ/31quj8TvfQffsrAycpkFbhkuGxxXAagANSEYO2WMobabSH/CXJWC6Ie3O/ZikjFWEppXbxcIP+g/spKJ6KqG1XD7iJCSb8/nRQX6Lvy0n9TebG1UMTZG4/mFjX8W+UmvuUFlNg+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=chromium.org smtp.mailfrom=opensynergy.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=opensynergy.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
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
Subject: [RFC PATCH v9 0/1] Virtio video device specification
Date: Tue, 12 Mar 2024 11:58:50 +0100
Message-Id: <20240312105851.243780-1-alexander.gordeev@opensynergy.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|BEYP281MB3812:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: da3edb60-2f49-4793-d02c-08dc42838775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P4OC/rYxyOvmbLbDuYY0SLjN86qoQrCRbxU5baTDFzR2SUGdTA6LevWih1/4A4ntkBmUrhYBiDdNKXcI24kgWH70foQW0FDdx2z3ltJpWXBCJoTVRfMZCWfNnc19SX5XVzItwCc2/Ithmh/3XoFZpSKbngfJep9wBEkM/U7HmTVB4fBOfeQjVB+ubyGTpdQTXSZQYvO5nrvLs24zZGy9+pYsM07uzI9Et2kcCQv5KzsyVRVff0pmugh9MG+I062P8xSdaAJAR3mbLXOPS8dKoxE0cSD+7wb7S65LZ+8NcDre7aeY6enUCV+6u5iA2ODpUvAKHB5SFBysbXLQidgKiCGWMMQT8X+cAki5XMvswroHbC/rt86DC7c4g+0yl5tpXsjZu12TNqA+hTCqM0J+WeDbClSKdFwzGQYWnotAZ/93kCfk10E7EetoQFNKADiP00dzD05dwHAwei3Mo5YpWIIkTbSgJfeSj9fzElS7b7nMo1PrQ0/YBOq40Zr8Spw2PLzi2fE2gj2CEaDN3arcMYjqfmemhCwjOOijFtlCKvpT6E7PP9TH7MhlUvHaLd92ae3PVYOPdeXXpE0dl1XJIWxOFtTelr5b5QQm7zBSe/OsWikshbDMhpLF28I2wjmgQu+A7CRgaK07GU++1mwYTqv7S3T/JZVDYJcPdxIRwrOeXStDcAKfwPJl3ALvskUBcbX5wmBaJkxwT+toHqPP/g==
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 10:59:45.9936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da3edb60-2f49-4793-d02c-08dc42838775
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEYP281MB3812
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28246.006
X-TMASE-Result: 10--17.288200-4.000000
X-TMASE-MatchedRID: KlGK0EfpKrtKqT77NMMyNxZu3Ax5Ngq859KGlOljPvuQEjOZZEyhAras
	XTFkoEYAhYNEGrSdk3jcBYoN9IgCH+7cQoOH30eiquZVB+P8J0YAf7GEWnsTRGSVHUW5n9Lh9NF
	KrIIXgXyHl7GO9ptPH77GcxyzvMofQlotKdXOGlGK7q7iyFn58ee6+kao1dvdkvRBElnsHbOIV9
	dyzzz/jqyFqPcqKs/nN5KkjJKvdUstHkTd8If/QVhkmCjWYvWlusBvtbk1teAugFBQy+58BQZIL
	dGsDavCr3RRr3ptPn3D85EiRKYySmBU2FL1ofut7lU0NYyj5VxWEpmiB2wI29THFoOVTUKPbafs
	koGxs3me8Tj8YASJOQjHjNQtMA4kG7nDH5J3xCYBmIwrrOlq1WGsEiRO8BnIpZd6jUkGtmC6dXa
	AYUzGlrIoaeeAvJLFt4fpjyEpFNq1MsxF+lLocdRBUD49QCgpDyrqR96pNEL9fsjZBWN6mnPeH8
	07NzYLrKVhusxXDCsphiMDWApKO/dniAo1PYHZEPSTHBgcfv6i3c5/PPV1uPt7J0kZt8YlGQCt0
	p3VQOxlVdfr0ykIxos72H+RnuZCeQczFQh2XEv4MTnOvlqF3MU/m8gE5vZPrf+sQ5qSfyxI+l65
	vTxt4rqaKIHX1SvitvjNRakP96uZd6OkvSXQQ3x2eIlQG1sMfC4IwOLvyuf/oGTNGh63fyJUNkN
	rt5r93+6k97GsyDiUTGVAhB5EbQ==
X-TMASE-XGENCLOUD: 5a69dfce-6f07-4538-9004-834dc4c6a3ff-0-0-200-0
X-TM-Deliver-Signature: 65153075E6A4CF5C93B0C4250A12FB16
X-TM-Addin-Auth: bbBll7Y/N6b5JwSwH6sKQIBikFBffGlM0VQTRgyWuPKi2E/qwgojkJArpar
	4YLaK+w1gjeTnePafIiW+gixHdSnrGLegdx7PKhXUUd/HFV01zQu1v7wTGyhe3Yp4nEat3jU7BR
	FxZwuXQslSKk+FvOGSHEFvQPFxcVUlswVcOUbA7Jy85qVdbHCIwUQ4VIn9RoJkT4hbhn4lMmBuG
	IKMVVqCUR2548mE9mI6qNJHNgu7O4yFmlvjDsKpnMAEsXGq8pXwhDfUbpRaAKyplWfUVZXaN5p4
	EVzxezUlgIKfH8n/8S6EVx7+uxla6/pyOaYn.PLsjzK4E/+GHK/8oqAgOD21ucU7/29It0mFTFF
	XHi0flf4lLgMD5VLOhunr9nj7j6fZMaSZxgrmQ/U1ak3xyUJCD8+nhxNjtBgYOPGYIAA5o7qqP0
	zAlFM5tT4pelP9uaQ/QNN5q6l2ghx1r59yMJnbooC94vcGvisxBz8QDMxDyI2fD86+yQ+bTIANU
	mc77W0cppOnjY0p6EiaELgm/XjS6g5ibZpwzHsAxSixsw4AQIItsSErCDI2NKia98iGr4aTGiWk
	lDKHh/TPl5EPsOL/3NHXRYFSbFjYDVpnLRGZUr7n9840BI81CLmgPDZE+TB4bC5RVyXBwbTw1vz
	ERQA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1710241191;
	bh=vxxP2+iaKewLGClE3Fzeah/djsRIX/5doINiMRwSrgI=; l=4690;
	h=From:To:Date;
	b=gdZEmqKdprTyhWZxCrZeQrFiOq8paJ66xAdZQrkAZ90Ji/dpgDHR7aCN2c7QhJpxu
	 dGp4vVZMQ7Mg5A3ltKCZMsRgsNYsdjIFp+cBqBG6qtgDgWnQAxuh4Tt/4gk21vIODx
	 Ebx115D64SXkW0o3ydmgNZuCWnEOYV+E3qv4jQhCaM/54CIB43POetieZkeVSw2aXJ
	 OjYF5mljx1ZUb44jqKT/lR8VzfPzNRlN9EMrbeNCmvRzdTNvX8jibIv5f0gnrvboTa
	 XyxTsB89n9hbsy3P0d9nLzlgaBT6ttMdle1fZFZddcNwWdkMVBkjDXgike9pRGz47+
	 wjY4Uw91Jmlyg==

Hi,

This is the 9th version of virtio-video device patch. Hopefully it is
the last RFC version. There are some major changes and now I think it
is good enough conceptually, but may need a few minor changes, when the
driver gets updated. Sorry, it took way longer, than I expected.
There are a lot of details to care about and also a lot of distractions.
Please review.

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



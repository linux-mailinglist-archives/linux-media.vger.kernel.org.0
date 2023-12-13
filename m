Return-Path: <linux-media+bounces-2370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A98811896
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 17:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAA86B20C9D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 16:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEFD315A4;
	Wed, 13 Dec 2023 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="DlTtywFx"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A716BAC
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 08:03:55 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231213160351epoutp02ad05f8ed64d415d23974f07ab86c5e22~gb6k5GYv-1565615656epoutp02E
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 16:03:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231213160351epoutp02ad05f8ed64d415d23974f07ab86c5e22~gb6k5GYv-1565615656epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702483431;
	bh=OgZVAXEtV8suSLJ6Dr7hECfwgGoiwUx6mifkxXdsDBo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=DlTtywFxq0a6DEPaqxQKMgnJ4ud8BTmVzwRooMkUh/UCtWW8zCwnXrmxbdz1ad99D
	 ubI5oW3/azKCdlvuPD7/WRKSysWa9ge2w9Jkzql9Q+Wfk8vMD/368zmPnA0/ucQw3R
	 L8oAj5lZiH8XG8OMbCJQ1tiAhtGkcq3yT6cM8WaE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231213160351epcas5p46cab66037215c0925956ac2936236a9e~gb6kNkOm_1959819598epcas5p4M;
	Wed, 13 Dec 2023 16:03:51 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Sr0dx62Xjz4x9Pq; Wed, 13 Dec
	2023 16:03:49 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.43.09634.5E5D9756; Thu, 14 Dec 2023 01:03:49 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20231213160349epcas5p213989378f9f73296271fee59fdfda3f0~gb6icgv_p0669706697epcas5p2O;
	Wed, 13 Dec 2023 16:03:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231213160349epsmtrp1e7d0731c1507cb07b34c3fc9f66e405e~gb6ibRFeN3192431924epsmtrp1a;
	Wed, 13 Dec 2023 16:03:49 +0000 (GMT)
X-AuditID: b6c32a49-eebff700000025a2-82-6579d5e50324
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8A.FB.08755.4E5D9756; Thu, 14 Dec 2023 01:03:49 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213160346epsmtip1faf888dd1fb284e8ef117dd3096776ef~gb6f-U6u30109401094epsmtip1R;
	Wed, 13 Dec 2023 16:03:46 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Aakarsh Jain'" <aakarsh.jain@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Cc: <m.szyprowski@samsung.com>, <andrzej.hajda@intel.com>,
	<mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
	<krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<andi@etezian.org>, <gost.dev@samsung.com>, <aswani.reddy@samsung.com>,
	<pankaj.dubey@samsung.com>, <ajaykumar.rs@samsung.com>
In-Reply-To: <20231213081105.25817-1-aakarsh.jain@samsung.com>
Subject: RE: [Patch v6 00/10] Add MFC v12 support
Date: Wed, 13 Dec 2023 21:33:45 +0530
Message-ID: <016d01da2ddd$f5606ad0$e0214070$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQCd+t1CDgDzjr5iAlOzWnInn9AzZgLfXkq/swjKbJA=
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfVRTZRzuvbvbvVDT24R4W+RZ9xyPKQK7xeaLE/KIdYbaOZzjP33JvLEr
	Q9hH2wilhJ3koxiIcPyjcUap84wihELJhUBzYMhHlMIwTaiOLkEJFjMPJlqMq8V/z+95n9/v
	Oc/vfV9SILkqkpI5BitnNrB5tCgS/7p7zer4gH8fJ+/3J6KAxyFE3pmzOHLN3cDQL64Qjnwn
	2wjU1DmEoU97hoTosvcbDF1wjOHo4MRvAtR6bVSIhtudIlT5ZZsQffxDF4ZO9IwRyN06j6Fj
	bbcJVNrZQ2ySqC8dnxWoXR2TmLq18SOR+upoh0h98nix+uCpRqAOta5U9/8VIjLIN3I36jhW
	y5llnCHLqM0xZKfQ23Zo0jQKpZyJZ5LRelpmYPVcCr1le0b8Kzl5C1lo2btsXv4ClcFaLHRi
	6kazMd/KyXRGizWF5kzaPFOSKcHC6i35huwEA2fdwMjlLygWhLtydeUPPiNMs9K99ul8Gxh+
	qgJEkJBKgofvzmAVIJKUUGcAfDDwN8EXswBWHvEAvrgD4OnBFrwCkIstla44nu8EsMnlfNgx
	AeAJTxseniui4qHHVSYKH0RRHgBHmlx4uBBQUxgs+fkyFlZFUKlw+oNvQRivoBjoqW3HwhY4
	tQq2VL8VpsVUMqy49AnG4ydhn+P6ooGAioPuo7cEfAgZvBtwC3k+Bk6e6yHCOIraAHv9M0Je
	M0fCWu/7PN4CB+o/f8ivgDd7TxE8lsLJ6jKCT6mGx+alPK2DfzS0AB6/BL0jzsVFCKg1sKU9
	kXddBqvuXcf4TjH8sEzCq1fBA9N+nMfPwBq7Xfho+JUzWYfAc3VLYtUtiVW3JErd/15HAN4I
	nuZMFn02Z1GYGANX8N9lZxn1rWDxma9N94CxX4MJPoCRwAcgKaCjxH2eAk4i1rL7CjmzUWPO
	z+MsPqBYWHWNQBqdZVz4JwarhklKlicplcqk5BeVDB0jvlVar5VQ2ayVy+U4E2d+1IeREVIb
	FmnTq9L0tWk95PK4uitF38tz3F/cWbaLzrZPBsW681vNv2uQKu6JNzclopLiwQHj0T3pbpvt
	n0DBa4MotqHQ7+wumVGVM7MXK4s7VPLU6pxAUf+MYsj22Oh3gJ4fDykK7dOdmekFywuvxTu3
	l9+TNGfGjr7dpdqtTM9U7lQEQlMoyhnaP7etZPBmzYSkIchWNezXevfcrkrw3X+5Fr6+80/V
	V6dlhws6hH3SmHeYYOzernSvNXqlw7H17PnSkfH5H4MDzuiEi1Ovnnt+3QXH+ubeKmOQMbsI
	ZcbqzXEjhh31B4bRe/bi3dpMkPHsfTpi80/NNyaMud3jfY+vK8Jp3KJjmbUCs4X9Fy+58PRv
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRmVeSWpSXmKPExsWy7bCSnO7Tq5WpBheXM1o83TGT1eLA+4Ms
	Fot/PGeyuL/4M4vFoc1b2S3W7D3HZDH/yDlWi5sHdjJZXJx5l8Wi78VDZotNj6+xWlzeNYfN
	omfDVlaLGef3MVmsPXKX3WLZpj9MFou2fmG3aN17hN1ByOP6kk/MHov3vGTy2LSqk83jzrU9
	bB6bl9R79G1ZxejxeZOcx6mvn9kDOKK4bFJSczLLUov07RK4MtZOnstcsESq4vnKqawNjK1i
	XYwcHBICJhI9i7W7GDk5hAR2M0q8/p4FYksISEtc3ziBHcIWllj57zk7RM0zRomfC1hBbDYB
	XYkdi9vYuhi5OEQE9jBKdE+9CJZgFvjFJHF6YiFEQz+jxI8mcxCbU8BO4l3TfkYQW1jAUGLH
	pF1MIDewCKhKrO+PAQnzClhKdF2fxwRhC0qcnPmEBWKktsTTm0/h7GULXzND3KYg8fPpMqi1
	4hIvjx4Bu1NEwEri+NX3rBMYhWchGTULyahZSEbNQtK+gJFlFaNkakFxbnpusWGBYV5quV5x
	Ym5xaV66XnJ+7iZGcExrae5g3L7qg94hRiYOxkOMEhzMSiK8J3eUpwrxpiRWVqUW5ccXleak
	Fh9ilOZgURLnFX/RmyIkkJ5YkpqdmlqQWgSTZeLglGpgUglyMuO5kTpjKevKZ+GiD/LDu8q5
	Xy4N/i7H5+sxTW06v2TW1uxes6CNlccap0SbXPM8GbgpW/TR1e73V+I6tQNsL8z3mD7Z6YEJ
	z0LrZ2smrLsSvkamPjWu41Tj3MofikwrNqbsLuDmkjlyPObowwfVDgGfbt2Q39z07ss2c7uF
	l46uLH/107jj8w3fXC4vJtcvPQVrPeU1a7abrXt5KffZQ+n/Hx8pqu25Z/DuUaG8WujWPskZ
	1y5d3qOltLlegeXxRf0pXzr6Avnf9YQt+hAqc0/h0r7NuoKvI8JnuLRsP8z8qPPHkT7F0z+2
	2CVv5jzyc6rYA63kThffyTdTssV2Oz7V+81mG/B0fbP5ISWW4oxEQy3mouJEAD+Eh8xYAwAA
X-CMS-MailID: 20231213160349epcas5p213989378f9f73296271fee59fdfda3f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231213081112epcas5p171f1b69376bc4b1e8ced03f8b56efe35
References: <CGME20231213081112epcas5p171f1b69376bc4b1e8ced03f8b56efe35@epcas5p1.samsung.com>
	<20231213081105.25817-1-aakarsh.jain@samsung.com>



> -----Original Message-----
> From: Aakarsh Jain <aakarsh.jain=40samsung.com>
> Sent: Wednesday, December 13, 2023 1:41 PM
> To: linux-arm-kernel=40lists.infradead.org; linux-media=40vger.kernel.org=
;
> linux-kernel=40vger.kernel.org; devicetree=40vger.kernel.org
> Cc: m.szyprowski=40samsung.com; andrzej.hajda=40intel.com;
> mchehab=40kernel.org; hverkuil-cisco=40xs4all.nl;
> krzysztof.kozlowski+dt=40linaro.org; robh+dt=40kernel.org;
> conor+dt=40kernel.org; linux-samsung-soc=40vger.kernel.org;
> andi=40etezian.org; gost.dev=40samsung.com; alim.akhtar=40samsung.com;
> aswani.reddy=40samsung.com; pankaj.dubey=40samsung.com;
> ajaykumar.rs=40samsung.com; aakarsh.jain=40samsung.com
> Subject: =5BPatch v6 00/10=5D Add MFC v12 support
>=20
> This patch series adds MFC v12 support. MFC v12 is used in Tesla FSD SoC.
>=20
> This adds support for following:
>=20
> -Add support for YV12 and I420 format (3-plane) -Add support for Rate
> Control, UHD and DMABUF for encoder -Add support for DPB buffers
> allocation based on MFC requirement
>=20
> changes since v5:
> -As per Krzysztof, he will take MFC dt-entries patch via Samsung SoC once=
 dt-
> bindings patch gets accepted. Therefore, excluded MFC dt-entries patch
> from v6.
> -Addressed review comments by Hans Verkuil.
> Resolved smatch warning from 'drivers/media/platform/samsung/s5p-
> mfc/s5p_mfc_enc.c'.
> Resolved kernel doc warnings from 'drivers/media/platform/samsung/s5p-
> mfc/s5p_mfc_common.h'.
> Added explanation in the patch 9 as comment on why mfc v12 firmware
> loading is needed for each run.
> v5 link: https://patchwork.kernel.org/project/linux-
> media/cover/20231206063045.97234-1-aakarsh.jain=40samsung.com/
>=20
=5Bsnip=5D
> Aakarsh Jain (10):
>   dt-bindings: media: s5p-mfc: Add mfcv12 variant
>   media: s5p-mfc: Rename IS_MFCV10 macro
>   media: s5p-mfc: Add initial support for MFCv12
>   media: s5p-mfc: Add YV12 and I420 multiplanar format support
>   media: s5p-mfc: Add support for rate controls in MFCv12
>   media: s5p-mfc: Add support for UHD encoding.
>   media: s5p-mfc: Add support for DMABUF for encoder
>   media: s5p-mfc: Set context for valid case before calling try_run
>   media: s5p-mfc: Load firmware for each run in MFCv12.
>   media: s5p-mfc: DPB Count Independent of VIDIOC_REQBUF
>=20
>  .../bindings/media/samsung,s5p-mfc.yaml       =7C  18 ++
>  .../platform/samsung/s5p-mfc/regs-mfc-v12.h   =7C  52 +++
>  .../platform/samsung/s5p-mfc/regs-mfc-v7.h    =7C   1 +
>  .../platform/samsung/s5p-mfc/regs-mfc-v8.h    =7C   3 +
>  .../media/platform/samsung/s5p-mfc/s5p_mfc.c  =7C  36 ++-
> .../platform/samsung/s5p-mfc/s5p_mfc_common.h =7C  33 +-
>  .../platform/samsung/s5p-mfc/s5p_mfc_ctrl.c   =7C  15 +-
>  .../platform/samsung/s5p-mfc/s5p_mfc_dec.c    =7C  60 +++-
>  .../platform/samsung/s5p-mfc/s5p_mfc_enc.c    =7C 149 ++++++---
>  .../platform/samsung/s5p-mfc/s5p_mfc_opr.h    =7C  14 +-
>  .../platform/samsung/s5p-mfc/s5p_mfc_opr_v5.c =7C  12 +-
> .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.c =7C 299 ++++++++++++++---
> -
>  .../platform/samsung/s5p-mfc/s5p_mfc_opr_v6.h =7C   7 +-
>  13 files changed, 550 insertions(+), 149 deletions(-)  create mode 10064=
4
> drivers/media/platform/samsung/s5p-mfc/regs-mfc-v12.h
>=20
Tested this series on FSD platform, feel free to add
Tested-by: Alim Akhtar <alim.akhtar=40samsung.com>

> --
> 2.17.1




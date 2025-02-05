Return-Path: <linux-media+bounces-25679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FDA2909A
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 15:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 251431886487
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 14:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0967515A86B;
	Wed,  5 Feb 2025 14:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="gJ/T0/Ey"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621FA7E792;
	Wed,  5 Feb 2025 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766294; cv=fail; b=udCL/pI3AE7runSwgsQxi+pUxSneV8/bagVHD/E6InbnEEJQYJaRbRPVtMuIOEzn/NOf8nIjw7FHYOLkVcZCO2KldbbA5qkh8CczLtCjMP10hCv+xbRklJqDXrBpyMSQXfJYCTWSyoZnczmw2DnO7Zb5UB0kC9O8oixfUCJqNI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766294; c=relaxed/simple;
	bh=mnzjpuUUx1AZhQjWflPn6ytx6x4B+2Efd+4OAE3vfMQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eQlEzkVYWl7RlHsVnk+q9KfRjIDj4aZ7UzlHPAAPMCs7sF/dqYBcRlomcZtf5yh3jjAtk0C8vqKlV95PDXzgpc+2wSPyTjs/FhM1DluJUQ3wDJeH3E7JKpfhqlqtpsCaqBv17q4P8SzhwQ49UvWuCdBiRf5oE/zEDKBeq4RU60U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=gJ/T0/Ey; arc=fail smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 515Cavtq1463202; Wed, 5 Feb 2025 21:36:57 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1738758986;x=1739968586;bh=mnzjpuUUx1AZhQjWflPn6ytx6x4B+2Efd+4OAE3
	vfMQ=;b=gJ/T0/Eym21cCoRCEdA9gWW/qEEclTggD1JMuRho9bLl20YabK35qYQAbsqtUGJ2nXlPM
	/4EPwY4EwilI+luydRhxCruFkVbUzSPBG2ebgyTHRu+R+JC4olfnl1OVHzOxlx0xKc7tHvwIjGxd7
	NDD1uo06jhoEsmxSFC8WhQi7AnleMTWGUuyh+cN4nH7qehhFfKz1qOa0Z1uP1cvpHBMym7H5TFkUO
	6eIdag8/yHszXU9MJkDJCPCjy5cNENBxQq7v3xnBHalawlkjlTwC7iUAAtRVoCj7c8fZCWCUtvVAc
	Nk0xvZXgVjTJ32xytKLxM42/b9g9kUP1tSooUwHQuA==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 515CaOYw1196226; Wed, 5 Feb 2025 21:36:25 +0900
X-Iguazu-Qid: 2yAbj3N9XXbP1lJokT
X-Iguazu-QSIG: v=2; s=0; t=1738758984; q=2yAbj3N9XXbP1lJokT; m=VcHHnagf16gtAramRJkxuXmDmPM6B2GZ44cPI3mw9ns=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 515CaMiw865689
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 21:36:22 +0900
X-SA-MID: 39103918
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/JGKWibLzUMdKYnXqkW2oOyJq2LyPX5AjnFpUrQ/lMRd7aygl1UzaPt4dKhWLK50uEc5Jp6XxnDEuNdDjXD1TIZQKDhSpMmD0VDRWOFPaxcpp3R4lwnJysWIJ46p3v/CCJjMqB4o5f9w+gV9ljs44aG8udkW4zB3xr1HyXAf/aKwouAjm07M+e55rCZ4BEnr2Jv//+Qq9f85ImlSzFbGkaSry8wepgagcse/BUUqRcyPAG/Foj1WEY+YsVwKdIxO0DMEpZXu+PQvAKqd+EMf8it8EpKQUL3A1YyS8QzO2Zga3U9v52xfTNlH/zFQduJecsCtj90D8e1Eor6MfKI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnzjpuUUx1AZhQjWflPn6ytx6x4B+2Efd+4OAE3vfMQ=;
 b=hVee41W2YAf1ftpfHm+f78Wey9T0tNU3yRyyXmkJZH4KQtxACQ443lLdqiCYoFZcpfeRCI1Cfe1ZM/fNbFooDxIDNrXwMYskbeDtg8Af2A35G9HDN74hQ2Bws1idzzp0JbSXDBczQ5ThMuV+Ee6ysZuOkLVVQj0OVHlJ1+WGT4pMl7v12OzYiUwr5VqDnNsHBaD7+eW93ylL3Ko1VJpJzgFINpyWiPmRFMFhhyc2hzVVb8tpn3M/wc5Gn5WDyN6HTsK1u6CYJ1v2X5m1+91wE6CLAxgxMh3oWWuBp0U0KlYfAu7529YZhTOJJGAmmDmuZP7+AK0j6nQ62smRarpV0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <laurent.pinchart@ideasonboard.com>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v12 8/8] MAINTAINERS: Add entries for Toshiba Visconti
 Video Input Interface
Thread-Topic: [PATCH v12 8/8] MAINTAINERS: Add entries for Toshiba Visconti
 Video Input Interface
Thread-Index: AQHbPxuFzscAjuV7NE+EymIdi6bLi7MDsuQAgDViRdA=
Date: Wed, 5 Feb 2025 12:31:16 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY3PR01MB9982674CA9B2D088DE142E0292F72@TY3PR01MB9982.jpnprd01.prod.outlook.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-9-yuji2.ishikawa@toshiba.co.jp>
 <20250102131638.GH554@pendragon.ideasonboard.com>
In-Reply-To: <20250102131638.GH554@pendragon.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB9982:EE_|OSCPR01MB15035:EE_
x-ms-office365-filtering-correlation-id: d424b71e-77e7-480f-13c8-08dd45e0fc58
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?KzJQajlubnZjQ1I2SUtwbmcrZXNoZk00UDhOaWM0aTBWR1gyRkxlZkJhTEMr?=
 =?utf-8?B?NFVJeENxMjAyTkJmUklJbitnejMyck1LblNMRVZQanNBNjdRVkVqTEN0dFRD?=
 =?utf-8?B?VGZEQXVGV0VQamhHd2VocGJlek1OWE5xSHhOYW0wZk04Ukw4TTZVZnZ4Lzlw?=
 =?utf-8?B?YzUrNzZBZ1libjJ0ZWp1VVVZL2d2a3Jzd2lzOEtTU2dNQ3BzK2FVTmVHTjFY?=
 =?utf-8?B?a2o4b3FTZnZCaHZLZ1cwOE04RGQ2THFKa2tqTzdmUncxd29zRnhvcTZ4ay9p?=
 =?utf-8?B?RXI0bG82bWYzUEthZmoyUEtpSStvWmVvQWxPRGVhYVBiMHptdzY2WE5lOWlX?=
 =?utf-8?B?ajJmK0JyV2ZFdW1jNkJzT241NmsyWjY1a2RtTEwrSFFVTEhxZ1ErcE5aWTdY?=
 =?utf-8?B?bEJxV0Ura0ZJNkpaRHRSMGVXd1BkdHBVeURDemljRUhIWFhoNE0zRzQvL1pw?=
 =?utf-8?B?M1VLbmYyQ0l2aXBpWTFjejFPZmZpaVZITWtMcUl4akFPa1Z6WSs3a3FOVFRo?=
 =?utf-8?B?T2E3ekErM2NqaE1nQ2M4Skx1MEVuRGJjK0RWcFVodFVJVDV1d1JBanVxZnJt?=
 =?utf-8?B?R2tma2NHWWFyQldCbkdPM3o1bXFnajZVQ0FxZlNGNmNLT0c1ZUM5azkwOExh?=
 =?utf-8?B?N2tMcW5RTVhwbTdiZnRkdjZZelh0Z3FzUzhiaDJuZEZ5T0lwZ2VjMHFIWm9J?=
 =?utf-8?B?T0M5dWRaOFJFLzJlL2JOVHM0d2liTXhFeSt4aStIMUc5dHgrSHkxVUdva3Rk?=
 =?utf-8?B?STZyV29lOCtQQjVINFVybXJaSDhMNm56TTNGb3RmcnE3V3BacGNZN01ndzBL?=
 =?utf-8?B?MGk2RGgwa0YrdEtXUThvR1pEb3M1dng3aUhaNjQxQ3F2K1lvQnZTSE5pYmZE?=
 =?utf-8?B?YnhZZ2VMUHJyVHp3SFVWRjN5TG5FYjRIOFpYTkpGUGNuc3F6M1c3RkFoWkdi?=
 =?utf-8?B?dExiMmhXVU1xMG1ia3o1cWk2M3NIaGF0Um93VHBsSGxmQ3huY0tEaDE2Ym9M?=
 =?utf-8?B?ZVM5Q0xQdDJ3d0VvcWtwN3dQU01OYUxZSGFwdjA5UW5RT3VGN2w0anE4UVh4?=
 =?utf-8?B?cGNpK0J1NVNkdCtVUEcwNE1razUzNy9RaFgxaUNpeHNIUnVZblViY21LWWlH?=
 =?utf-8?B?cGQvQzhXL0tPVGtYMkdwdzk5cnFFUjMxSkkzQmwrYUZYQlhFY0FWWFlSck9s?=
 =?utf-8?B?eEt3LzByL2NsTk1ObEwzYVA1RmYyTjVrckFFQVMvekEyNXcxZWlxVTNydXJo?=
 =?utf-8?B?aTliYjUrSFgwR3BwN2dMSHUzODRibE94NEoya2sxUkJlL2tSTkRndEp6MDlW?=
 =?utf-8?B?aDNvZFd5UUp0MG85emprbzJBUmxHUmpSbzFoVGhobFFWMlJxZnN3OGhIMm9l?=
 =?utf-8?B?ZzAyOEJjb1FmcUFJWDh0MlpDUTFhdy9PK0hXaUZZRkdITDVDQzczaDR0eWs0?=
 =?utf-8?B?YTU0Wk9DRW9DZ1F4bTNMLzNMdnlvc2p3Sk00OTB4WGtnaVNCN2ZhdUNoRXdq?=
 =?utf-8?B?amhPcDRqWSt3YVdBQ3JhZWdVUXNWMlhWSXZZcnczcFpiT3VFUFpyNmRrcXUx?=
 =?utf-8?B?Q2lJNFdLSkJqNFNUOERBczVjaG0rLzdaT0ZKViswZ05tek9WS2VCalhIVlhW?=
 =?utf-8?B?alhSdlQ1a1NSay9zU1BPYWRuc3RXRHJXR3Q0bHdoY0hBUlQ1dkV1VzIwa1Iz?=
 =?utf-8?B?dVR5d2VOSkVyNmU2YlpVMlBGbDZGNVlYYkhMbytVWGNxWWEyNEc4RVBTU01Y?=
 =?utf-8?B?RFFpZ08yN2QvZFlrVmFsalN0UEkvd09nejNxOTVNa0Q0eVZsaGgvTU1hSmlI?=
 =?utf-8?B?VGdSTTdMVWdwaHVJMmQxekhHRmRYMzlQUDhhajJFWXNjNTdnSzJwMVB0ZVh5?=
 =?utf-8?B?MUxSYVZpN0VzV09DVks2YUNDbkFoNittVFZibFRnWUxHUEMxTmxVZWloWm5x?=
 =?utf-8?Q?TKiCBb6MPSVk0cDIrni+nlOEwEEkjL+K?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB9982.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHdzUU50cW1udVlmdWlMUm10aFVSRThoaFdneEdPNkd2anlOTS81QXpPbHJv?=
 =?utf-8?B?U29pNTh1STJSN3BsTHphbnhXYStrYUo2RkdTVjdDaTJVc2tZRzVjRnBuWW04?=
 =?utf-8?B?NHBhZWt2V3VwZXRLM3pId29QSVFoVkNpZXVxc0xSbWJEU2Z3NElZbHJrRlVp?=
 =?utf-8?B?cERHU0UyekRZcFRrTFY2T2tmbjZxWUxrNzVSdHhJTmFNcDdyMXE5K0kxS2FT?=
 =?utf-8?B?TDNwb3ZSMTBuNXlsU1Rmb1VoMS8yQ081SC9YUHpiVWhpaDRCS1VUbWFzc1NY?=
 =?utf-8?B?VHlEc3RqR3F0STh2dmhLZ0pFcVNDS2dxd3FCYXNiMFBGSjltanJQZjRVMzI0?=
 =?utf-8?B?SkpGTUNWR25qcEsrTm9FbGphMzV6NFJzN2hyaGQrMDVVeTcrSkFPbGdVd0sv?=
 =?utf-8?B?SmJrKzU5Q005WjJPckpmVXh2TjVRelk2WjRQeVNLS2JxWVFRVFNUaXVud09U?=
 =?utf-8?B?QjY0ZElBWHVtY3hpc2tiSHdidnFBc0lqdmNwYTRicUVLYTcyRzFQdlBsYmxm?=
 =?utf-8?B?QjhXMk11QlZhVzU3dHFzMXNZbEtKbGJlODVQNXk4L05xcEV5UmVsM3l4ZldM?=
 =?utf-8?B?bko0OUljbGU2WHY4M1Z0OVNEZWIxTXpVVU90eERFREZUK1NXUlUzYU1YUWcz?=
 =?utf-8?B?aGpnUDhVajFXL0luelFSaVpNVURza1JtQzlKZ1J2MExNYVNKM2NpRUlFdXVj?=
 =?utf-8?B?S05vdXRWck5TN05HQlk2R1I2VzcwNktFZnQxdmE1RVozWGpKU3ovR1p2dG4v?=
 =?utf-8?B?dWRxVUhaN21ueXhFNnpmd0tBQkNEZU5yZkNRSGZNbnl1eGpkQ2lJV0V6dS8v?=
 =?utf-8?B?K3JzaHZoRnpsUDlZQWg2cVFpY0Q3OHZPd21uWFZWNlFyYTY3NUFOWmVEa0tl?=
 =?utf-8?B?NUF3RzVhR1ZVdXo3RFhMbkg3ekV0bWk0WFZjcXEzT0tNbU9QWWNLM2dCUEUv?=
 =?utf-8?B?T2FISC9lMFh2TWhLNDRnYlRVaG5kd1V3RSttYzFxWGdtZEl2UFUyYkhwdCth?=
 =?utf-8?B?d3h3WTdBdjFhRE85VHFKbkNLZDZyaDAzazl2QUlqZ1lTWkpCQjA2VGhlUTVK?=
 =?utf-8?B?NGh5MjRZdWZBRDFDc1VzTlV1QzFUeDNUS1g0VURhbkNxQndFdUg0V0NmOG5I?=
 =?utf-8?B?eE84aFJmWnJia1NlemUxaHNqYVdYRE5iVUN4bmZtc0xvVUQ0UVRMS0tScHBy?=
 =?utf-8?B?aUtHTjRJc2VXdTRJOWRIbDJsUFNBbEtycGpUcCtLNXgyMjg5UG9uVm90Vit4?=
 =?utf-8?B?RnJTb0JCZDEwSmtteCtUNjBxakd4Znc2RlVhZTFsZENOVnRmVnJxcDJiTUdh?=
 =?utf-8?B?V2ZBa3ozQVdaalkwSGd5ZDFTd29pVEEwczFkTUVlZlFBMm5tM003Q0RvdEN2?=
 =?utf-8?B?LzVZK2M3VHp0bnFVRWVibGs2RzhDVHNhaDBVaTlhUUJ0NnMxcTZ6U2dqMS81?=
 =?utf-8?B?MU9MbS9CMEVsU3dndUlJWDhDam51NkNadG54SFMvcnczZGcrUnI1ZitmQXVB?=
 =?utf-8?B?eC8yUnNqS3NNMCswdGpCVm4yaXRBbHExQ0Fpd3ZrT09tN3FscGdRQnNvMEF0?=
 =?utf-8?B?dDBMbENtYVNYdjVCOGpsSmpLWUNFSEJBRC9WWDRVTGRuVFdYY1hPSzJCc2tk?=
 =?utf-8?B?NURDajd0MnpDd1pHbDZRSUFDWUVrQWlvMzN4WEtGSDZiQTFqeTdNcStRcGNH?=
 =?utf-8?B?MkNQdENscEF1SXBLaGZEOWI1SXFQWVE0T25oZit6SytkbktScW9qbTRjZHMr?=
 =?utf-8?B?WkNaL05QSC92eXFGd0FIb2ZjcXoxaUpYWG1FQlJRL2lMWVRlZThEYk04dW84?=
 =?utf-8?B?V1VnMG44bzRYYStMa1d6Z1kzYVZJMFpyUndzOUJGWEliaTlKUHF0WFFCbFd1?=
 =?utf-8?B?ZG1UaGJ1cTFqOVRMWHdDNGRZOGptNU5IZUtzK0dwV2R3UDVSNVVHWnVTYkMz?=
 =?utf-8?B?ZHZ4Tjl4cUx3QWU3ZWZ4anNDRVlPSUVFbEFrMXMzUnAzS2tRTzRrOGUzNTlO?=
 =?utf-8?B?WGM0dXhManVrM2kyOW5Yb0M0d3dzaFlTUjFta1hMY0MyQVFCa2t1dFV2Rmo2?=
 =?utf-8?B?eFlZQTM5RGF6Q1NEZTlvZCs0VlFLMVoyNndUQXgzbzRXUDFFcmNrcmg4L2NV?=
 =?utf-8?B?ZHF4cTc1aXJyWUkrM2pOTkZvK2J3V09YRlh3VEl5SUliZ01xOEw3SlNyeDZq?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB9982.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d424b71e-77e7-480f-13c8-08dd45e0fc58
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 12:31:16.4964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhky9tr2tqg1Vz7fBiDJEPm82pt8NqNDeGu/MgaE3JEgWNd2LQhEzbrhf5y3B6sGyOf5MRo4zbIlDCYQY+dxEPJIsamLsqo++rA9VaJ8eCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15035

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHJldmlldyBjb21tZW50cy4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKYW51
YXJ5IDIsIDIwMjUgMTA6MTcgUE0NCj4gVG86IGlzaGlrYXdhIHl1amko55+z5bedIOaCoOWPuCDi
l4vvvLLvvKTvvKPilqHvvKHvvKnvvLTvvKPil4vvvKXvvKHplospDQo+IDx5dWppMi5pc2hpa2F3
YUB0b3NoaWJhLmNvLmpwPg0KPiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtl
cm5lbC5vcmc+OyBSb2IgSGVycmluZw0KPiA8cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxjb25vcitkdEBr
ZXJuZWwub3JnPjsgU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsg
SGFucw0KPiBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+OyBpd2FtYXRzdSBub2J1
aGlybyjlsqnmnb4g5L+h5rSLIOKXi++8pO+8qe+8tO+8ow0KPiDilqHvvKTvvKnvvLTil4vvvK/v
vLPvvLQpIDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5jby5qcD47DQo+IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMiA4LzhdIE1BSU5UQUlORVJTOiBBZGQgZW50cmll
cyBmb3IgVG9zaGliYSBWaXNjb250aQ0KPiBWaWRlbyBJbnB1dCBJbnRlcmZhY2UNCj4gDQo+IEhp
IElzaGlrYXdhLXNhbiwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24g
TW9uLCBOb3YgMjUsIDIwMjQgYXQgMDY6MjE6NDZQTSArMDkwMCwgWXVqaSBJc2hpa2F3YSB3cm90
ZToNCj4gPiBBZGRlZCBlbnRyaWVzIGZvciB2aXNjb250aSBWaWRlbyBJbnB1dCBJbnRlcmZhY2Ug
ZHJpdmVyLCBpbmNsdWRpbmc7DQo+IA0KPiBDb21taXQgbWVzc2FnZXMgYXJlIHdyaXR0ZW4gdXNp
bmcgdGhlIGltcGVyYXRpdmUgbW9vZCwgYXMgaWYgeW91IHdlcmUgZ2l2aW5nDQo+IG9yZGVycyB0
byBzb21lb25lOg0KPiANCj4gcy9BZGRlZC9BZGQvDQo+IA0KDQpUaGFuayB5b3UgZm9yIHRoZSBh
ZHZpY2UuIEknbGwgdXBkYXRlIGNvbW1pdCBtZXNzYWdlcy4NCg0KPiA+ICogZGV2aWNlIHRyZWUg
YmluZGluZ3MNCj4gPiAqIHNvdXJjZSBmaWxlcw0KPiA+ICogZG9jdW1lbnRhdGlvbiBmaWxlcw0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXVqaSBJc2hpa2F3YSA8eXVqaTIuaXNoaWthd2FAdG9z
aGliYS5jby5qcD4NCj4gPiBSZXZpZXdlZC1ieTogTm9idWhpcm8gSXdhbWF0c3UgPG5vYnVoaXJv
MS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPg0KPiANCj4gSSB3b3VsZCBoYXZlIGFkZGVkIHRoZSBN
QUlOVEFJTkVSUyBlbnRyeSBpbiAxLzggd2l0aCBqdXN0IHRoZSBEVCBiaW5kaW5nIGZpbGUsDQo+
IGFuZCBhZGRlZCBtb3JlIGZpbGVzIGluIGNvcnJlc3BvbmRpbmcgcGF0Y2hlcy4gVGhhdCB3b3Vs
ZCBiZSBlYXNpZXIgdG8gcmV2aWV3DQo+IGFuZCBjaGVjayBpZiBlbnRyaWVzIGFyZSBtaXNzaW5n
LiBJIGRvbid0IG1pbmQgbXVjaCB0aG91Z2gsIHNvIGlmIHlvdSBwcmVmZXINCj4ga2VlcGluZyBp
dCB0aGlzIHdheToNCj4gDQoNCkZyb20gdGhlIG5leHQgcGF0Y2ggc2V0LCBJJ2xsIHVwZGF0ZSBN
QUlOVEFJTkVSUyBhdCB0aGUgc2FtZSB0aW1lIGFzIG5ldyBmaWxlcyBhcmUgYWRkZWQuDQoNCj4g
UmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gDQo+ID4gLS0tDQo+ID4gQ2hhbmdlbG9nIHYyOg0KPiA+IC0gbm8gY2hhbmdl
DQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjM6DQo+ID4gLSBhZGRlZCBlbnRyeSBmb3IgZHJpdmVyIEFQ
SSBkb2N1bWVudGF0aW9uDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjQ6DQo+ID4gLSBhZGRlZCBlbnRy
eSBmb3IgaGVhZGVyIGZpbGUNCj4gPg0KPiA+IENoYW5nZWxvZyB2NToNCj4gPiAtIG5vIGNoYW5n
ZQ0KPiA+DQo+ID4gQ2hhbmdlbG9nIHY2Og0KPiA+IC0gdXBkYXRlIHBhdGggdG8gVklJRiBkcml2
ZXIgc291cmNlIGZpbGVzDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjc6DQo+ID4gLSBubyBjaGFuZ2UN
Cj4gPg0KPiA+IENoYW5nZWxvZyB2ODoNCj4gPiAtIHJlbmFtZSBiaW5kaW5ncyBkZXNjcmlwdGlv
biBmaWxlDQo+ID4NCj4gPiBDaGFuZ2Vsb2cgdjk6DQo+ID4gLSBubyBjaGFuZ2UNCj4gPg0KPiA+
IENoYW5nZWxvZyB2MTA6DQo+ID4gLSBhZGQgYSBzZXBhcmF0ZSBlbnRyeSBvZiBWSUlGIGRyaXZl
cg0KPiA+DQo+ID4gQ2hhbmdlbG9nIHYxMToNCj4gPiAtIG5vIGNoYW5nZQ0KPiA+DQo+ID4gQ2hh
bmdlbG9nIHYxMjoNCj4gPiAtIGFkZCBhIGJpbmRpbmdzIGRlc2NyaXB0aW9uIG9mIENTSTJSWCBk
cml2ZXINCj4gPg0KPiA+ICBNQUlOVEFJTkVSUyB8IDEyICsrKysrKysrKysrKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL01BSU5U
QUlORVJTIGIvTUFJTlRBSU5FUlMgaW5kZXgNCj4gPiBiODc4ZGRjOTlmOTQuLmI1YzgxOWU5NGU5
YiAxMDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+
ID4gQEAgLTIzNDMwLDYgKzIzNDMwLDE4IEBAIEY6DQo+IAlEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvaTJjL3RjMzU4NzQzLnR4dA0KPiA+ICBGOglkcml2ZXJzL21lZGlh
L2kyYy90YzM1ODc0MyoNCj4gPiAgRjoJaW5jbHVkZS9tZWRpYS9pMmMvdGMzNTg3NDMuaA0KPiA+
DQo+ID4gK1RPU0hJQkEgVklTQ09OVEkgVklJRiBEUklWRVINCj4gPiArTToJTm9idWhpcm8gSXdh
bWF0c3UgPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPg0KPiA+ICtNOglZdWppIElz
aGlrYXdhIDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNvLmpwPg0KPiA+ICtMOglsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiArUzoJTWFpbnRhaW5lZA0KPiA+ICtGOglEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL21lZGlhL3Zpc2NvbnRpLXZpaWYuKg0KPiA+ICtGOg0KPiAJRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Rvc2hpYmEsdmlzY29udGk1LWNzaTJy
eC55DQo+IGFtbA0KPiA+ICtGOg0KPiAJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL3Rvc2hpYmEsdmlzY29udGk1LXZpaWYueWFtDQo+IGwNCj4gPiArRjoJRG9jdW1lbnRh
dGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC9tZXRhZm10LXZpc2NvbnRpLXZpaWYucnN0DQo+
ID4gK0Y6CWRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdG9zaGliYS92aXNjb250aS8NCj4gPiArRjoJ
aW5jbHVkZS91YXBpL2xpbnV4L3Zpc2NvbnRpX3ZpaWYuaA0KPiA+ICsNCj4gPiAgVE9TSElCQSBX
TUkgSE9US0VZUyBEUklWRVINCj4gPiAgTToJQXphZWwgQXZhbG9zIDxjb3Byb3NjZWZhbG9AZ21h
aWwuY29tPg0KPiA+ICBMOglwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPiAN
Cj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg0KUmVnYXJkcywNCll1
amkgSXNoaWthd2ENCg==



Return-Path: <linux-media+bounces-2473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19540814F64
	for <lists+linux-media@lfdr.de>; Fri, 15 Dec 2023 19:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5BB3283A04
	for <lists+linux-media@lfdr.de>; Fri, 15 Dec 2023 18:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0CA45C09;
	Fri, 15 Dec 2023 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="ftY09Hwg"
X-Original-To: linux-media@vger.kernel.org
Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763E47F4B
	for <linux-media@vger.kernel.org>; Fri, 15 Dec 2023 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.10.202])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id 43A5F101728A1
	for <linux-media@vger.kernel.org>; Fri, 15 Dec 2023 17:06:43 +0000 (UTC)
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.176.220])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id AE9F810001FAB;
	Fri, 15 Dec 2023 17:06:36 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1702659991.733000
X-TM-MAIL-UUID: 4e1a249e-f24e-4745-8577-734b5e2758d7
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id B33DD100010CE;
	Fri, 15 Dec 2023 17:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O173PpRZP8cXnqgDjZBI1p40M22EfiIzoidiS77JaLV0ezsvJ2iP97bYYX6iTuVCh+JOFhWKm37PknJDsqn1ap0SFrEHCpOZqlUpU2HNcLVVkpa6xevDg6uMCSgcLcsRRpshOCJJMPR5+Orw6MHu6RQxCVpGWtHXimJkUCxA7c1fu6sb2lFHY10UYyOaWwmVjf5/l/vAB7eV49EmWZQleNb5vZWIG1j4lUjlH6e98LX4EVwHUE4ZZr3MaE4et7wVtPxUR5IX3Avk+dP3aiqL8syqdbN542iCOkUL3eqrmDnw450DTusZ2yC7l/m31MF1DyYOJvq8jaQNh+pBd+tG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxdRALdmmndsl+WjCBSs0QFp+BhkPj8vkh5dlhdYbzo=;
 b=li96INeJYzcNrwKfy0YrtTNviNFNMnMpJG7h+lfjkthOAUEVIairyQ9jzk0BFmB5d6X6iukF0ucjW0+wJV8/W2URfufzA+ALY5qLtKkcfx/ZDRA6sPqBXGByiSRjY+2JYE7n7zTO9dnvWvvo5DMCjm/L5FksNVpfZP5lz4WhqzxkHzyLdBq2T+dIVKgOD2OWJgIWi4Z/cSHJ29Xzualkd+XRaFK+iMbaL3rVNxLAAzKHh2y9pSYK4aCRZx9Dilbt01d14zwSfEXCvQjRr7zc96GW6bFf9EtdFCfUX4ZPRdqgdvRbRm386cFVOYnrXMZ6Klr/theRI0d0L2Drin0f9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <565caa81-c265-4986-80b5-5a0e0ebbfe6d@opensynergy.com>
Date: Fri, 15 Dec 2023 18:06:09 +0100
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
Subject: Re: [virtio-dev] [FYI] virtio-media published
To: Alexandre Courbot <acourbot@chromium.org>,
 virtio-dev@lists.oasis-open.org, Keiichi Watanabe <keiichiw@chromium.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Enrico Granata <egranata@google.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Peter Griffin <peter.griffin@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Albert Esteve <aesteve@redhat.com>,
 Enric Balletbo i Serra <eballetb@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <CAPBb6MUB9GTEOCCkvVK9+ukjuYr9x6X8Kv-XSHT1tNd_=ZCCfA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPBb6MUB9GTEOCCkvVK9+ukjuYr9x6X8Kv-XSHT1tNd_=ZCCfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:4d::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2663:EE_|FR2P281MB1493:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b05816-fa30-43c7-c2c3-08dbfd9023c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/XQCJ9TuxUfXvGiZ5Q4u3/ap5AllHtIl9z4M5ukL0LPCpCWx3E2W8WpN4bMKz/kv98b8A+zAvjE8p4pbLYUoDaVVEvmrmBvdEfpGxIuU0rU/pNc/piCfdZgAy4uYHx2wMiuVctolnoAqShbQYv902NAhIqN7ymIQN3/btyQe7NxQdh2bHDn/eYmJHt4ae6nyEZWNcCgQcYe5+gfWcQXWbLie0sv7DG6bpWSavcldw9FSb3YEwlfXlWWrSCtnQOqq2fUmu+HmQxPiw2vY8/6Jab/nOqNug3vdOGpVt7vrBo0RaGS+VfMJKgco+7BfSZ+bL3g+I+rFlsU+4Osx2fpUy8LEvkPvpTgkFLZLwVMBf+WH5A2Op/rLlG8x2op8E6fpFK1xi9e9eFYOUgG57LPBboPTGItS7G5LEMbB0VWapdoAUx8V9gJz3CyZtFEVMU8QFEW0upoZYU2E2tq74B/n97pQ7menhfkuWCQrqd7tb83hGWsIqURPJRB2Gk435hkrferDyjh0UrJKK+3PduCjJkr05pc0EINcyyLSXYEPT0stNCY9Gcqq0LlcsOw21OzqNRcoRuHuNUedywWkp8SL5coHYlHD0Jct3cYuqoMlwjN3nYDWbWKB0/S35YwWeAqKexZ/z0G0GTBNUCJrkW5mmrpp7gcqSjoc6SOeJMrwFXdxYwzOFjk5nFr1uiF882wWo3wpZeLbisnckX5M61pbYXooeNe92bFY9rrrXsO4MvLgJlgIlNiPDZi5s2Crvu7v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(136003)(346002)(376002)(366004)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(38100700002)(83380400001)(66574015)(2616005)(26005)(15974865002)(36756003)(31696002)(86362001)(31686004)(921008)(53546011)(478600001)(316002)(110136005)(66946007)(66556008)(66476007)(42186006)(44832011)(8936002)(8676002)(4326008)(7416002)(2906002)(5660300002)(41300700001)(66899024)(966005)(18886075002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJwZWd1QXJHU2ZzQXZtSi9YMDJuNU9BZ2ZuTWpkWnhSYWR6dTZadEU5dWJv?=
 =?utf-8?B?WUxtSm9WSkt2MGZIRCtweW1oSndrTFUvNFEwS2J5blJHclBGZW9kd0N0eElp?=
 =?utf-8?B?MVFTYWdXejkvYXBMTkwrc1hUeVhqdGVnK0s4eW1FSmNKZzBOdVhGTndwejl4?=
 =?utf-8?B?TkgwbUI2Sm5hK2x1MnVMS2l4L2pOZElRTlQ0Y0hJbDh6YjZXcnVjZ2tkb3dy?=
 =?utf-8?B?RUNtbE5iOHIxMklialE2U2x3NzA4R0x1b1RtYkpIMU1uTlBqU0UxYUErODdH?=
 =?utf-8?B?RUVFQ3RXcWdHS08vUXBiYTZveU9HZDBEVGVTNDlzV1VhVmp5WWhLL0wwb1VT?=
 =?utf-8?B?ZlBibWhRYmcycDlXTU1SZUZIMDJRNFhMTXNqSFNlcTd1bk5EM1RLT3BaMGJF?=
 =?utf-8?B?SGJnQnFYc1ZvVlJTcUNjMTJBTGRrdk9IK1FoNDN5R1Fyc243aEZqM3B4aERZ?=
 =?utf-8?B?dXdkQWRFYTRjNDVnVWtHalhUeXhKUmdmMEFyaDUzNkVBMEpYYnFmYkxOQTl3?=
 =?utf-8?B?UEFVTUtQUmhNYitiS1Z3dGtwcjdTYUZKWGg1WFgxOEMvdFFzcWtna3BWQjFx?=
 =?utf-8?B?Z1hVN0JBS1ErRGtURWpHb29ETGpXYXdTeVRKRnRyUWd6UGRFOVczODQzcFNu?=
 =?utf-8?B?SnEvMkphTHFUanpQT3djeUJYRGVRZlgrc0xvQnFFM2w5ZWlBSTBWbVZwMHhk?=
 =?utf-8?B?WHJ4b2xhVjIvQzBOZEE3TGdsS0hzcVlRenVhT2wvOGNQK0pScjU2d1ZnWEVL?=
 =?utf-8?B?QmtYZUFoVldRdVVDc3VYQnpaSm8zbWtIcW1IbXNNT2hNVHdYRTBha0R4WnBn?=
 =?utf-8?B?NDNBenpjTHA5L3JqK2RVTWVOaGpHazM1QTI4VHVhZVZLUlJBbjVyWm45V1RG?=
 =?utf-8?B?cVdKbXNTYlNHbUVobUt4aldvS01qQU5oR1Rvb0h3VndWZTh2RFFSWFV4Y1N6?=
 =?utf-8?B?Q3NIUUlGaUtYalBzY1lIMXljSlJnSVhyeFExRzhLUzY3S2V0TkhpR3hseSt5?=
 =?utf-8?B?d2JIaGJiU09jK2J1WGRFWHdIemsrUmR6bllDUDJwa2xTKzkzaUNtTjhZMTE1?=
 =?utf-8?B?NFV1RXcrTGhRRUt3Q1N6SzJRWVQ5YTRKN1Ric0xWcWxWODl0c3ZrMklNb3N5?=
 =?utf-8?B?NjY5clBzNjRJMUY0WmFrZmpUSVoyTlBFTnJuMUZ3R2VyRU9XQmhtOE5EOFJj?=
 =?utf-8?B?eW1FWTgwSkN2UG5CLzMwZlZtc3ZJMDIvajlsWHlUM1k5bVFuVGRRVGlyZjFU?=
 =?utf-8?B?cnRUTC8yRUNScVd1OUswc2wzV2hCNGthWXhkNklkU3NkTHg1KzU0bDhjOTkx?=
 =?utf-8?B?WWdWb2p3ZWo4K28wbDdFZHFoMUJLMUNMeU4rMkczT21RK3JLU2lWRWI0cC9s?=
 =?utf-8?B?dXQ0b291b00vRTgweUIzUDJidWNkZmNxNlFsQk9rL3RhR0ZTOXEvemlYZkRC?=
 =?utf-8?B?LzQ2QldzM3F3NldGUWJ3QURoUVVPRmZVMnhrTkx6NndhMFBJdFBvQjJqbTZo?=
 =?utf-8?B?dkt2OU1aV2lGdFRnbWZ0V1BteU9JU3d4MFZaRTRMblczWnc1bjBKbjRZQ1dX?=
 =?utf-8?B?OXlDVENYTXZHWC8rUUNFYkpsZUdINWJHNGxaT055cU9GRXFONkxpKzJWRGkr?=
 =?utf-8?B?TmVRSWZxZzYxQjRnWnM3eStMMUk4K1ZSNkloTitJQndGdmtjRXo0ZEdZdWJl?=
 =?utf-8?B?TXZaamNlSUtSdlNzT2Y1aUhjMStISkpoS3BoOGc1aHJZRnFoZy91YVdjY2FL?=
 =?utf-8?B?Y3hDNXViNnB4YTBZellFTnFOUmJaWFQyc01sYUpMYnRLeW5xSGRzTDlvUWt4?=
 =?utf-8?B?cWg0UDgrdU9BRC91VWZUSUlONFBKMmRRU0Y2L0p3aGZjQnVnWG1EdGNhMmps?=
 =?utf-8?B?QW5RK0Fhd2FrSkoyU00yQWkxdzFpbnU4aGJJbWFZdmpZUFVXVnZ1eUxPVXY3?=
 =?utf-8?B?OUxjdThPcjhpZVQrYkNidlkzQ0lZQ0dzbFp4Y25ReEFvV3N3T0lMOFR3VmVw?=
 =?utf-8?B?NDg4WWtpSDhBbFFSL2toMk5KSGcxSWdwTUlsMVZxTmVFMFgvYnY3Rnl4ZFNU?=
 =?utf-8?B?ZTlveHo5azRaYnlBQVRQcFliMWZWaWx4L2ZSbjY3MStNdURpSTA2RGtDY1B3?=
 =?utf-8?Q?WpHLwRlcfmYg6lUjCWzbQYRog?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b05816-fa30-43c7-c2c3-08dbfd9023c7
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 17:06:12.1667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DcbUc2NIb0gyYZ3CnQmpT7EzqTw08rKA/UcZvcfVZMIebL+KVHUaK/2xOzLHLSCU+CzTiUYs3E++FH0puzUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1493
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28060.000
X-TMASE-Result: 10--40.970700-4.000000
X-TMASE-MatchedRID: pS5owHKhBO1TzAVQ78TKJRhvdi92BBAuZZo7GJOF27w+Jg7sQdznaC1A
	/qnDlqGPbla8FhEn9PIiIVtdVGJtllqPuP6oS1CgyFDZkw29Gnd+rvFZ7FWrXDNAfx3yUfA1CWf
	GypM5xXaUWekBRLlx6XjQ87yT5j5EYCl9Xr4YR30JZ2Q97L+53c+9rQ+ljgUnTlSOM+BNiL4LqD
	WUa6yBu7jeR1lu1L9sZxm2RMNMojf5UddjPGCpJUu+LBodhvWxdk6/NJBGmFCxudxEPUAkyYJlm
	b3RzhIp3HOpc4CZLQcysLuJGJcdncI9hEgAH/r8Oc/clmqx05oKzfE0xibHNGJZehP8D8gvWw9N
	wxLd8qawI8Xrrq+fExNpDC2WjCEMZmsRbccTY/sKF2uJnUkQnTj61oDLR3drbj2SieHkk2vU/J8
	4SO43LfDGBg5ufDiF0j1B4XMPhRxOXnjbL4IT2FwHkvsOWIElnsSRXdX/K/sopiVY+XbpKx2Mkd
	Wr6fH0eLbIdIgehmwTSqeAkjZ6elqRCJs0u+v8u/wZEqxodZbcHWFKCmADc32UusLR2KGihAp8W
	TCcb1HJx6y9ncpH1BXZn7E8b534fPJecbrfukut08hy9o8h9k1PNCqyOwZW+1XRz2to3juCmtee
	y23Hj9fOKzqD25xs9UXszzqWyTgxGyPqPPqrtXm+Q5vBy6UjF7y9TyEP/27ECRw17nUg4Qia1sm
	LyWvDuGzZRrQ1ZQlPh+VxVo2i/GWgOHX2HAB6XXnihXHRjbrFP5vIBOb2T63/rEOakn8sT0BRZN
	I+YwbANog326X8vtXNOAQ2MSi2r1XUU2qCmvLmpxRaxzhc08JZct3jDYTA3+6k97GsyDiUTGVAh
	B5EbQ==
X-TMASE-XGENCLOUD: 9bcd318b-8d8c-4284-b03b-133d4c9e6178-0-0-200-0
X-TM-Deliver-Signature: BE8361C5681C6979641E48EF1BCE2286
X-TM-Addin-Auth: 4SqF4cpXR7U7dG6eJSDNDPLzxoDUOyHedAcaczQVYaNHfA25iJsiFNuCexg
	C9Mc2OE1gSOhC1lIykiUdHpudZ9g1jMv99JYZmhs/FXyeQt21SVZtnXpTUoQi+IgqlL0JZxIYrJ
	iEESDHWKHzbsovW2IeAHnOmI8Ee1+OLyY4ou1W71YdiLROejLDpo1f7cgotmkTAAwYnbTbVuzTj
	eeRajzNKee/o/vXywbt6dXAR++Xv2jIueghucvekt3yJgAUxdvU5Ni0X4P501zTHtYZXA0fyhHO
	VGKdoxIlvaet/uE=.g1NweUGEQShbWQKyB6HnRxSVkmFV4QjBsZJpURDquruAEtYOF/OF1yewFh
	vDqfKKLSL3mTW9PzIZ5h9qKpv87OcXcbO0GyH++Hj5X/yOqoqEpKm59eGufj5qKozYQrhpiyofu
	HKYQvbDTFd8iP9jgsYtArIur7I9TjXCd3fnR6UGTzPZIZJS01U1kEU6NMVduE2efv7q02SmQRMd
	7M92o5Ixf2x67bLOP53O+R/R/HROoGPOeXkwVVMVh1bh6pTzrqB08yHsr2gA37mVqjx7DOZaLvg
	ZR5mD5xRRZpB6RiYVf7tMEPTPpCTwvOfEmBDnm3rUt+BZauQKt6LTGRFQSw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1702659996;
	bh=o6fO5pWSk05d0RLdPTbj2Rym9P3Ew7k769f/n/V53iQ=; l=6654;
	h=Date:From:To;
	b=ftY09Hwg6s3jXTpTN5ZGKS6mv5kNSMWkScJjfkjlhoMbM3L3xm6yJKDB1I2fPSe9H
	 Ndz9Pleo9lBB7Lrya3eFQlIsaauH7WcCqEqm7fViN5YBipJz+kBOpdUf7R9dP8CIrq
	 0xNA87FsgwqTlTLYm+oILqGoWBQ3hAKNA/JTlyvDuaC6CbzO0A3WTIJHYZeIxjkYjk
	 ITu14YpwGIk9xbmoi1BjrrSx/9ULQ5+DhTY6L7RKvIP+6XQslIump5xTtXlxGm+lg1
	 AQzg+rOg18EOAbLNgsMYhrbjjxcchS9yVSKb1JfMSy8ql9H5bA0PY1WorY6Howweph
	 oruZCJxCQYe9g==

Hello Alexandre,

On 08.12.23 07:46, Alexandre Courbot wrote:
> Hello everyone,
> 
> This is just a heads-up to announce the initial publication of virtio-media:
> 
> https://github.com/Gnurou/virtio-media
> 
> The name has changed slightly, but this project is essentially the
> refinement and continuation of my virtio-v4l2 proposal. The reason for
> moving forward with this is, to be candid, the unclear direction and
> lack of progress regarding the future of virtio-video, and the
> non-consensual way in which its development has been, let's say
> "redirected".

Great! I like the new name. The old one was confusing IMO. I'm going to 
have a closer look later.

I'd be happy to clarify the current progress and the future direction of 
the virtio-video. I'd like to make these major changes in the next spec 
draft:

1. Represent the capabilities and parameters with TLVs. Basically I'd 
like to take the data format from VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS,
flatten it by replacing the pointers with the actual data (this would be 
then in fact a sequence of TLVs). Then use this data format when getting 
capabilities (all of the VIDIOC_ENUM* and VIDIOC_QUERY* in a single 
call), getting and setting parameters (parameters + controls in V4L2 
terms). Here I'd like to reuse the control ids and value definitions as 
much as possible. Maybe this data presentation could be used in V4L2 
later. I think it would be digestible, as it is an extension of the 
extended controls. Indeed it was not clear, I even thought device trees 
would be a great solution at some point (see [1] for the rationale), but 
several people convinced me, that's not going to be merged in the kernel.

BTW this activity was influenced by your comment in [2]:

> Beware of not repeating the same mistake as v5 (all controls under one
> big structure).

2. Make the input and output resource queues explicit by turning them 
into virtio queues. It became clear, that after making the commands non 
blocking, some of the queue control moves to these internal resource 
queues. Then I thought: why make another queue implementation, when we 
already have one? So I think it makes sense to turn them into virtio 
queues. I still would like to keep the delayed responses over the event 
queue because I like to have this ordering of the events. Otherwise the 
DRAIN has to be done in some other way. Also I remember the comment by 
Bartłomiej Grzesik in [3]:

> I remember having a few thoughts on how it could be solved and I
> think that removing the need to block those descriptors is the best
> approach in my opinion. One would argue that preallocating descriptors
> for this purpose or splitting the command queue to input, output and
> control might be a viable solution or per stream. However it would
> only delay the issue in time or could cause other streams to "starve".

So I'd like to try both approaches at once.

I hope to finish the next draft in 3-4 weeks and publish in January. 
Hopefully the virtio release will be done and folks will have some time 
for a review.

Also I've been busy updating the virtio-video driver. First I decided to 
merge all the existing patches. We have a lot of not yet published 
changes internally, also you and your team made a lot of changes to the 
driver. I went through all of these, merged everything carefully, 
learned about some of the problems, that you encountered. This was a big 
chunk of work and now it is finished, see [4]. Still working on other 
driver updates.

The first problem was about making a distinction between guest pages and 
exported buffers. The final solution in your patches AFAIU is to map 
VB2_MEMORY_USERPTR to guest pages and VB2_MEMORY_DMABUF to the exported 
objects because this is the only hint, that we have from REQBUFS. I 
think this is not good enough, because dmabufs can be of different 
types: it could be an exported object or, for example, one created with 
udmabuf. I don't think there is a way to provide this information to the 
device until the first buffer comes, right? So the spec should be 
changed in this regard. I think it would be enough to add a requirement, 
that all the buffers belonging to a queue must be of the same type.

Another problem is setting the DMA masks and other such stuff. Our 
current approach is to register the parent device, which has all the 
related fields properly set as it is done in virtio-gpu, see [5].

Overall I'd like to highlight the fact, that you and your team already 
have a lot of influence on the virtio-video direction. I was very busy 
with investigations trying to select the right solution and merging the 
patches, but I think this only makes the whole thing better. :) So your 
comments are very welcome.

> The repo above contains the specification in the README file
> (presented in a more informal way than the virtio specification), as
> well as a guest V4L2 driver able to pass v4l2-compliance when proxying
> the vivid/vicodec virtual devices or an actual UVC camera using the
> crosvm V4L2 proxy device [1]. As of now it is basically
> feature-complete and offers everything that virtio-video is supposed
> to eventually do. I am considering adding support for multiple devices
> and requests to allow more complex camera setups.
> 
> Since the initial proposal has been rejected I have no intent to push
> this forward for merging in the virtio specification, so this will
> live out of the official spec. However, it is likely that we will soon
> switch to this solution for video support in ChromeOS and possibly
> other Google projects with a similar need for a stable virtualization
> solution for media devices.
> 
> Anyone who is interested in using this for their project, or with
> specific requests, is welcome to contact me or open issues on the
> Github project.
> 
> Cheers,
> Alex.
> 
> [1] https://chromium-review.googlesource.com/c/crosvm/crosvm/+/506532

Kind regards,
Alexander

[1] 
https://lore.kernel.org/virtio-dev/a9235fe7-7448-fa9f-ea52-fd27f4845bc4@opensynergy.com/
[2] 
https://lore.kernel.org/virtio-dev/CAPBb6MXw5PebCXYBvXOP_b2j+t-1Y_rSJv7kWkLPsa3X+uM9gA@mail.gmail.com/
[3] 
https://lore.kernel.org/virtio-dev/CAKxn3ec7nDy9B0nyHUg3GfXt_oktrC91kB3QWXM-sGh8ectE5A@mail.gmail.com/
[4] https://github.com/OpenSynergy/linux/tree/virtio-video
[5] 
https://github.com/torvalds/linux/commit/b5c9ed70d1a94c59dad7b1ecfc928863c0fe6ac0

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com


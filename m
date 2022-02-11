Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6343A4B22CC
	for <lists+linux-media@lfdr.de>; Fri, 11 Feb 2022 11:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348814AbiBKKJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Feb 2022 05:09:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348808AbiBKKJN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Feb 2022 05:09:13 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D544A2D3
        for <linux-media@vger.kernel.org>; Fri, 11 Feb 2022 02:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1644574151; x=1676110151;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=d2+7Sr3oB29MWdX92hSdkY5XQoqi3ynnpSOQ3SEgylA=;
  b=KQ+4h8LWG7J1QN/HRXrbfSIy9vNAT3UW4LR5W5kXqxS5dsps8ZLwkLKk
   nZoF9X6pjOzTadO+NYOZdgP9jXZexDIfb3O4iDXdV0aEQbyhd7qsIuseb
   S8dyv9egxrZOg2yCBmeylBqZmsOg9koz9sPtixjaQ70qokI9Xf+6W/Hrz
   xdCewmELT1UpFGAjhSy4P4ypO+ClW81yns6yMuRnzzuWnsSNdJ/gPu1ki
   VOf5DR8QiFOO+eJlFAajONRaIF8mxATIRw+T1IomFTz2b+r4gYh1FPaya
   zJ3kZxTlDkESBPbkpAkaVUzktPvwS+bhGlbTHAOIZbem37xEFX+djaxZ1
   A==;
IronPort-SDR: wi/cX8S2wVgW9FRhXBCE4WVqI2DIOuhM1tXGyakhl4kyIMxeIHtP5ejhbuLFBB2ZQtmig2nk4Z
 9P8YiEHqz3ASrQ3+xmTse/nDU75qpwXlooWxqWuSFDZkxocFWLDY5Q3Bg0yiXx6Hq3YFC2a86Q
 tkExie/khaRGFnX5Qz+QcbNjiY01xqwFAxGxtly8Dtq6TMizRIRxv7ESEgAh1KyALjUdQ/ck0r
 H8sNpy7TaO8gryfh+k7KtfP4jnIX7AaaFhkI+DzoqOgFi1rGpB/e9/N3NCMMNpz12geNzjpDun
 LcQd4N68kN08G57aArYzVUHn
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; 
   d="scan'208";a="145649926"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Feb 2022 03:09:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 11 Feb 2022 03:09:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 11 Feb 2022 03:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJZ+Qn6Mm5rBWzXZNVMi4N4vD7wUZ9j4KziPc/YiZm9AgklYtIJeoKwVc6kHiLtkGSHkaJsWBQguLWqMFM6vTnAgUWDN958JVGCXR3L7XhLwdAU828ZXTCtCArSQorw+yfZpo9/QHl4GakQGHdebi6b1L5obMBZqs2PhPRcVVdDbj5Nighn2Hgq7bUftGTfCMc/UcqR3zRxmjv0Yzz5VMubnnazHzgdEGuZ2XlGTRDvkSUC59Nksa2cAkB0/Svo7oh3XRtK4vR+uBMKEut94V1RandDL2+zPTdfCbbTWYjTB0ydk1hOY4vXvp09bMxxfvpexHVu6ZL5CIydAobqKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2+7Sr3oB29MWdX92hSdkY5XQoqi3ynnpSOQ3SEgylA=;
 b=Ixkn5xZnl4CyueU9wQZfPP1VY2WvLu2stcC/EdkK8TfnWPbOpYH0FVjpa+um1CBw49ct1dqhXPQDnGGc8IKACSlFD5jRjhmNyrCaHZL5sz5UALrKoE3w8dm151Fv1X7SHsnK92Z90LDA89NWYsyBNmu066+sS8ABVaa9S26u0H62Kp5IxnuE4iLrKXGVkDzL6+2hq++2iPBLZSMT9GoandwQEFe3G/jwf85g4WD+ECkKrlQhcK/T5w/SZUO5PhGwGF4l/Uf9DiR2x0EmUBmHmi1OyxDeQktlunPe8HgZHKl+JD2phZOWI+X2ABUUDAInf5zwVr8mwGNxCafaypOsyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2+7Sr3oB29MWdX92hSdkY5XQoqi3ynnpSOQ3SEgylA=;
 b=kgLM61IeB7kOlwGKr/pUrm4na9/r6zZSwDET2/Qul1zc9prVx3dbPQVplOVpfoQy3Bs0DYM9m4tbhwWzhIEds+jcQ0uA4ac1LkmQ8Nk1DX/Cl/HKDz7PnIv0fZYLY+g7LZDd2H1fufmPRWbQriQD+UK8+uzdCtdqFSmOD/953Y0=
Received: from BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14)
 by CY4PR11MB1256.namprd11.prod.outlook.com (2603:10b6:903:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 10:09:04 +0000
Received: from BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc]) by BL1PR11MB5384.namprd11.prod.outlook.com
 ([fe80::11a5:42e0:3f3d:fcdc%9]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 10:09:04 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <slongerbeam@gmail.com>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <hverkuil-cisco@xs4all.nl>,
        <mirela.rabulea@nxp.com>, <xavier.roumegue@oss.nxp.com>,
        <tomi.valkeinen@ideasonboard.com>, <hugues.fruchet@st.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <aford173@gmail.com>,
        <festevam@gmail.com>, <jbrunet@baylibre.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 00/23] media: ov5640: Rework the clock tree programming
 for MIPI
Thread-Topic: [PATCH v2 00/23] media: ov5640: Rework the clock tree
 programming for MIPI
Thread-Index: AQHYHm3wW57rjknMlU+S0OxseioqJKyOIe6A
Date:   Fri, 11 Feb 2022 10:09:04 +0000
Message-ID: <a5a75d0b-7f40-39d0-a8ec-4e143c5f3b1c@microchip.com>
References: <20220210110458.152494-1-jacopo@jmondi.org>
In-Reply-To: <20220210110458.152494-1-jacopo@jmondi.org>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ff33af2-05b3-41e3-9440-08d9ed468896
x-ms-traffictypediagnostic: CY4PR11MB1256:EE_
x-microsoft-antispam-prvs: <CY4PR11MB125630C2CA649CEBBC251437E8309@CY4PR11MB1256.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xkhOh8d1VliqbXaNpDx4X3xbYg6tsQHKVlwxnepC35IAz64aPzbDkRcCs40Qcy4NnEsJ3/y6L9XiAumIGc2LDsksaYrdF3aO92jSZy1WVR9J3JS3rSsTQ5sfGh+VDTMNhYwiMFvUquTWBfur6Zlx9pBvfOwYJWydyJ+fvCXJRQBzeBOkr9JacXW5Jees5Zc8xdqXHBKD1SBXV32B9LTh+qrweZPJlTteqXiIf7rWJJqwWLWZriTAuvKb6Tvoptsuwl13A4jQODjK6AsYFgfBjPI9kav+/inRATr7SwyQA/IXzD/vFlfRXwRLuErvXDzzJ0gubnVI5BAiW5wj7NlPBl4QvLaAztowdXqqvtaF0eE8265jJE7TxjT308cNSwGu0Yi7CsOfEcdKMyu+264N6Mezp3ruw5Kk+xwugn8aO4HH+iOgjF9ojI0egezwhNeiy8PI6VUA6YyVBunnkeeaZJSdO1ubdlKpnEirxZUstMXZAfPgOgP8D8uRoEVAzBk0+BwDomph5AahQvMfJ73y8P1++/OTCKTNWoLf4d+WK/8HZ/iL2dC6VOlrCOOb/qrCumjgAJkEWoqKjKGInzoxC5JgygX164Wm099CzV1wh1Wo05gXqG5/UnP7mq+MUZzNcHPqKAihQE70+9TYBdgA49KCXThvbq/979N2hwOfXps/l9Wnl+que6qtvqzr4fTiLm2wJMP6fHrIEir5m/rJ6WntjhHl55R4myeBN38T6gPWHI8xmk9F1NUGM+j37sgotkBRxeX56w0k6pL6ctJ31HzWGnnW4h3FpyandZXYY7DyZAnF42G9P0NsEGPEvTVOx66+Tklk+oGBmk+N3UkYPmQ6mnZDLPv16wbtzqOijac=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5384.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6486002)(36756003)(86362001)(64756008)(6916009)(316002)(966005)(66946007)(83380400001)(122000001)(8676002)(8936002)(38100700002)(66476007)(91956017)(66556008)(26005)(2616005)(186003)(4326008)(66446008)(71200400001)(76116006)(508600001)(6512007)(6506007)(53546011)(38070700005)(31686004)(31696002)(7416002)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YkJYeDVQeTBwc1lZM2Z5UUFiVy9LUnZQK1liS2sxVzZ1bHQ5Q2dVUEhLK3VH?=
 =?utf-8?B?RVpxL20veWlzbU5kRE9aKzVSYm5iZGVpVk01ZU1yMEIxK0VNYy9NUUtQczNs?=
 =?utf-8?B?TjFsVS93bFFOMEVPOXQveFFrYStwT1pocjh1cmtDSUJ5YkJtMUhPc21PdkNT?=
 =?utf-8?B?VXU4VlZWRmV4TkxmeXR3UkMrQ0xCK2NZSVFYVUZmU3p1OUg4WE1HYVZZeHRz?=
 =?utf-8?B?d1k3aXBZeXNiUGhVYXFmeU8vL3JIcEl0TVJHcGZTNHhGK3RpcmNMZmhjOHEv?=
 =?utf-8?B?SC9kWkJrWmVxbURzNGlyWUpsWU83Mk5zWkIvTmRkSEJvb2FUc0grMkNtdWZD?=
 =?utf-8?B?RHplUHFBdkkvYnMwWTF6ZTRkSEdqNHd4azhWYkJhdlRoS3FrdTBFYWM4bWFZ?=
 =?utf-8?B?Ujc3WWtvWGFLKzcwa1J1OXE1dGVSV1BRdDkzdkg3NjdZbUI1Y3czQnR5ZzJE?=
 =?utf-8?B?eGRrRHNRU1RpbXJlaXgzeEVISmV4YlZodHAyeVliVlR4U3RZUW8zL0wzS2h6?=
 =?utf-8?B?MEpPdlJLUDNoamFZY2Jsc2huM3ZHV25DZUs5azI3S0t4MXdURVdPM0NGb0Z2?=
 =?utf-8?B?V0xpOXhEZWs5dnpTMTZGblNuczZNd0J4M3N0MUc0UmRKUU5vclVyd2dwb1hV?=
 =?utf-8?B?NmU4Q0hSWTVwaURwWmNVT0c4NmpKekxoTGVKWmRPTFQ3NVhqVkp4WlJzNHJv?=
 =?utf-8?B?YW9SUW03bHpmMkNkdzB0UEVBb1dlL2wvMG4rbWRaREw0SVhFUmhXb3ROdFVJ?=
 =?utf-8?B?dVRlbFA4NGJpZVg1YkZXbW9kSEtoNXZPMEc4MTk1cFFuazcrQ1BCTXg4bkRz?=
 =?utf-8?B?NXQ1WTFHMVlLa1laWFRPU0IwYXYrdzNpekNXNUJoejRrQXh1Z2JNSGJKU0Zh?=
 =?utf-8?B?YzZyamMvNjBaZ3NLZTVnbERXb3RiK1VQc2JEQ2praDhYZmpPOVBsYUpQYTFZ?=
 =?utf-8?B?ZTBVd2t5VDUwVk01d1hmc0dGay9Ka0FQTStKN0dRMW1NMTM0TDh3aGw5eEcr?=
 =?utf-8?B?N21sM0ZBR0k0MTZnUUtpUmxYdU9WM1lnVnZDcHRBdHJnZ0lTWmhBQTArT3NM?=
 =?utf-8?B?dFl5Wjkxam10bFNkNzh5bFRIMWVqSzNNNkd6a3hMM1dicU1meGZ0cmc0dFFy?=
 =?utf-8?B?NUVGME1hdkJkRmdzWmR4L1VDdVBRMG83b2lzOGlnSndaSG9OSzRhdHNKWHhz?=
 =?utf-8?B?ak4xWDJsbU1SdVVCWmYxSDUySFFHMWs5bEdmWEdhVzFiYjZ3YXhPQmx3WjNM?=
 =?utf-8?B?MVdHZEx0TS9wZFpkYzc2SXhxOU1IbFlWcVNDa3BLS24wdWR3LzlTL1dyemxS?=
 =?utf-8?B?TnljVStvaUgycXp2djdMTUEzTGgvSE81bFUzYU1qSlRTUGxaWTU2SWJxWTRI?=
 =?utf-8?B?ZUhuTnRvaWxITGM0aTlURjZsL2E5N3kxYnFYc2xKM3Y5aDdVbjFIR21aTWw2?=
 =?utf-8?B?MGJoTVZGZlljMDhZeXc0MkxWeVcwNU5CREIvNTJ5clhiam5rcWFkblBDUHpG?=
 =?utf-8?B?UUE1MStyU1NWcHFNY2VQNzVFNmozU3l6K0d0a21oOFBQUlNaU1Zwck1YUXRz?=
 =?utf-8?B?eGNFNzlmMDFSQkFtV2tJWlJ0YzlmeEY4dExpUG5sL241R3ZvQnljZVlRSkZo?=
 =?utf-8?B?NTNrTElmaGNkN0Z6b3B6KzJSUzdUb2NTVUZRV3VUUlErRng4aDdiT00zcTB2?=
 =?utf-8?B?V3grUkNuN0plR2FVNWw5U3Q4bmJJazc0SFZOMUlMWUtNRmxyVGE3VUg0WWZq?=
 =?utf-8?B?cmFkbVpUYURQU3BzN21LUlVReUdKYlBYMS8yOTRjL2xEMGUvSnNTTHkzaDhs?=
 =?utf-8?B?cW5ub2hkQXFPUG1Fa2tocXRrOG1RcDBXS1JrWndZa1pRL1B6Y005cmZlZ3I2?=
 =?utf-8?B?RGNLeGR5RS95Z2ZPQnhtMXJwRTlLQUJTSkc3eUZiNWVOMTVSQnN3WlJJTmIv?=
 =?utf-8?B?Wk9XYU96ZTVmYTRoaW01aVUwcDZ4dEpGS2xOYllJMGdtOXRTakk4UUcvN2pi?=
 =?utf-8?B?YnhzUmVmV0twcTQyVmNQZEQ0OVUxVGdoYnc1WVRYMzBYUjVnT3gwQ3VFQS96?=
 =?utf-8?B?UkZiR3ZpUDBTK2tzUDNjRkk1S0lwOVJ0OXI1SzIvQTdJNERQUGlFdUdFOUVH?=
 =?utf-8?B?TnBPakJZQlpidWJzeTloREVETmp5TDZuWlFsdWRlQWRXVHU5VEJoRnJGSGo2?=
 =?utf-8?B?OFM1SkNWUU5aSWNpTHhyWnd0MnJvMEtqVzI4aE1CcUdUWnRDUzUvOHltTnZy?=
 =?utf-8?B?VlJScDNHcmZuTE1QUGM4U3EzMUZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9496BD1ACB188418594E64FB851459C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5384.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff33af2-05b3-41e3-9440-08d9ed468896
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 10:09:04.3605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /OZ0cZ1ET+i/vkyjJ9JIdwqhyCM3J10OMtBk18fQJ9o+8062XqzKhuEMUhPcuTliI6jvulGud0QAfOtN5UCpBqsgecce7AAIoPfURFKIPDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1256
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMi8xMC8yMiAxOjA0IFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQoNCkhlbGxvIEphY29wbywN
Cg0KPiB2MToNCj4gaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9saW51eC1t
ZWRpYS9saXN0Lz9zZXJpZXM9NzI0OQ0KPiANCj4gQSBicmFuY2ggZm9yIHRlc3RpbmcgYmFzZWQg
b24gdGhlIG1vc3QgcmVjZW50IG1lZGlhLW1hc3RlciBpcyBhdmFpbGFibGUgYXQNCj4gaHR0cHM6
Ly9naXQuc3IuaHQvfmptb25kaV8vbGludXggI2ptb25kaS9tZWRpYS1tYXN0ZXIvb3Y1NjQwLXYy
DQo+IA0KPiBJZiBhbnlvbmUgd2l0aCBhIERWUCBzZXR1cCBjb3VsZCB2ZXJpZnkgSSBoYXZlIG5v
dCBicm9rZW4gdGhlaXIgdXNlIGNhc2UNCj4gSSB3b3VsZCB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZSB0
aGF0IDopDQoNCkkgc3RhcnRlZCB0ZXN0aW5nIHRoaXMgb24gbXkgYmVuY2guDQpTbyBmYXIgdGhp
bmdzIGxvb2sgZ29vZC4NCg0KVG8gYmUgYWJsZSB0byB0ZXN0IHRoaXMsIEkgaGF2ZSB0byByZXZl
cnQgdGhpcyBwYXRjaCA6DQoibWVkaWE6IGkyYzogb3Y1NjQwOiBSZW1haW4gaW4gcG93ZXIgZG93
biBmb3IgRFZQIG1vZGUgdW5sZXNzIHN0cmVhbWluZyINCg0KT3RoZXJ3aXNlIHRoZSBzZW5zb3Ig
d2lsbCBub3QgcG93ZXIgdXAgd2hlbiBzdGFydGluZyBzdHJlYW1pbmcuDQoNCg0KSSBoYXZlIHRl
c3RlZCBzZXZlcmFsIGZvcm1hdHMsIGFzIHlvdSB3b3JrZWQgbW9yZSBvbiB0aGlzIHNlbnNvciwg
Y291bGQgDQp5b3UgdGVsbCBtZSwgZG9lcyBmb3JtYXQgWVVZVl8yeDggd29yayBpbiBwYXJhbGxl
bCBtb2RlIGF0IDE5MjB4MTA4MCBvciANCjEwMjR4NzY4ID8NCkkgbWFuYWdlZCB0byBnZXQgaXQg
d29ya2luZyBmaW5lIGF0IDY0MHg0ODAgLg0KDQpUaGUgc2Vuc29yIGxvb2tzIHRvIHJlcG9ydCB2
YWxpZCBmcmFtZXNpemVzIGZvciB0aGlzIG1idXMgY29kZSA6DQoNCiMgdjRsMi1jdGwgLWQgL2Rl
di92NGwtc3ViZGV2MSAtLWxpc3Qtc3ViZGV2LW1idXMtY29kZXMNClxpb2N0bDogVklESU9DX1NV
QkRFVl9FTlVNX01CVVNfQ09ERSAocGFkPTApDQogICAgICAgICAweDQwMDE6IE1FRElBX0JVU19G
TVRfSlBFR18xWDgNCiAgICAgICAgIDB4MjAwNjogTUVESUFfQlVTX0ZNVF9VWVZZOF8yWDgNCiAg
ICAgICAgIDB4MjAwZjogTUVESUFfQlVTX0ZNVF9VWVZZOF8xWDE2DQogICAgICAgICAweDIwMDg6
IE1FRElBX0JVU19GTVRfWVVZVjhfMlg4DQogICAgICAgICAweDIwMTE6IE1FRElBX0JVU19GTVRf
WVVZVjhfMVgxNg0KICAgICAgICAgMHgxMDA4OiBNRURJQV9CVVNfRk1UX1JHQjU2NV8yWDhfTEUN
CiAgICAgICAgIDB4MTAwNzogTUVESUFfQlVTX0ZNVF9SR0I1NjVfMlg4X0JFDQogICAgICAgICAw
eDEwMTc6IE1FRElBX0JVU19GTVRfUkdCNTY1XzFYMTYNCiAgICAgICAgIDB4MTAwYTogTUVESUFf
QlVTX0ZNVF9SR0I4ODhfMVgyNA0KICAgICAgICAgMHgxMDEzOiBNRURJQV9CVVNfRk1UX0JHUjg4
OF8xWDI0DQogICAgICAgICAweDMwMDE6IE1FRElBX0JVU19GTVRfU0JHR1I4XzFYOA0KICAgICAg
ICAgMHgzMDEzOiBNRURJQV9CVVNfRk1UX1NHQlJHOF8xWDgNCiAgICAgICAgIDB4MzAwMjogTUVE
SUFfQlVTX0ZNVF9TR1JCRzhfMVg4DQogICAgICAgICAweDMwMTQ6IE1FRElBX0JVU19GTVRfU1JH
R0I4XzFYOA0KIyB2NGwyLWN0bCAtZCAvZGV2L3Y0bC1zdWJkZXYxIC0tbGlzdC1zdWJkZXYtZnJh
bWVzaXplcyBwYWQ9MCxjb2RlPTB4MjAwOA0KaW9jdGw6IFZJRElPQ19TVUJERVZfRU5VTV9GUkFN
RV9TSVpFIChwYWQ9MCkNCiAgICAgICAgIFNpemUgUmFuZ2U6IDE2MHgxMjAgLSAxNjB4MTIwDQog
ICAgICAgICBTaXplIFJhbmdlOiAxNzZ4MTQ0IC0gMTc2eDE0NA0KICAgICAgICAgU2l6ZSBSYW5n
ZTogMzIweDI0MCAtIDMyMHgyNDANCiAgICAgICAgIFNpemUgUmFuZ2U6IDY0MHg0ODAgLSA2NDB4
NDgwDQogICAgICAgICBTaXplIFJhbmdlOiA3MjB4NDgwIC0gNzIweDQ4MA0KICAgICAgICAgU2l6
ZSBSYW5nZTogNzIweDU3NiAtIDcyMHg1NzYNCiAgICAgICAgIFNpemUgUmFuZ2U6IDEwMjR4NzY4
IC0gMTAyNHg3NjgNCiAgICAgICAgIFNpemUgUmFuZ2U6IDEyODB4NzIwIC0gMTI4MHg3MjANCiAg
ICAgICAgIFNpemUgUmFuZ2U6IDE5MjB4MTA4MCAtIDE5MjB4MTA4MA0KICAgICAgICAgU2l6ZSBS
YW5nZTogMjU5MngxOTQ0IC0gMjU5MngxOTQ0DQojDQoNCmJ1dCB0aGUgSVNDIGRvZXMgbm90IHJl
Y2VpdmUgYW55IGZyYW1lcyBhdCAxMDI0eDc2OCBhbmQgMTkyMHgxMDgwLg0KDQoNCldoYXQgSSBj
YW4gc2F5IGlzIHRoYXQgdGhlIHJhdyBiYXllciBmb3JtYXQgd29ya3MgYXQgMTkyMHgxMDgwICwg
ZnJhbWVzIA0KYXJlIHJlY2VpdmVkIGNvcnJlY3RseS4NCg0KVGhhbmtzLA0KRXVnZW4NCg0KPiAN
Cj4gdjEgLT4gdjI6DQo+IC0gcmV3b3JrIHRoZSBtb2RlcyBkZWZpbml0aW9uIHRvIHByb2Nlc3Mg
dGhlIGZ1bGwgcGl4ZWwgYXJyYXkNCj4gLSByZXdvcmsgZ2V0X3NlbGVjdGlvbiB0byByZXBvcnQg
dGhlIGNvcnJlY3QgQk9VTkQgYW5kIERFRkFVTFQgdGFyZ2V0cw0KPiAtIGltcGxlbWVudCBpbml0
X2NmZw0KPiAtIG1pbm9yIHN0eWxlIGNoYW5nZXMgYXMgc3VnZ2VzdGVkIGJ5IExhdXJlbnQNCj4g
LSB0ZXN0IHdpdGggMSBkYXRhIGxhbmUNCj4gDQo+IFRoYW5rcw0KPiAgICAgag0KPiANCj4gSmFj
b3BvIE1vbmRpICgyMyk6DQo+ICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBwaXhlbCByYXRlIHRvIG1v
ZGVzDQo+ICAgIG1lZGlhOiBvdjU2MDQ6IFJlLWFycmFuZ2UgbW9kZXMgZGVmaW5pdGlvbg0KPiAg
ICBtZWRpYTogb3Y1NjQwOiBBZGQgb3Y1NjQwX2lzX2NzaTIoKSBmdW5jdGlvbg0KPiAgICBtZWRp
YTogb3Y1NjQwOiBBc3NvY2lhdGUgYnBwIHdpdGggZm9ybWF0cw0KPiAgICBtZWRpYTogb3Y1NjQw
OiBBZGQgTElOS19GUkVRIGNvbnRyb2wNCj4gICAgbWVkaWE6IG92NTY0MDogVXBkYXRlIHBpeGVs
X3JhdGUgYW5kIGxpbmtfZnJlcQ0KPiAgICBtZWRpYTogb3Y1NjQwOiBSZXdvcmsgQ1NJLTIgY2xv
Y2sgdHJlZQ0KPiAgICBtZWRpYTogb3Y1NjQwOiBSZXdvcmsgdGltaW5ncyBwcm9ncmFtbWluZw0K
PiAgICBtZWRpYTogb3Y1NjQwOiBGaXggNzIweDQ4MCBpbiBSR0I4ODggbW9kZQ0KPiAgICBtZWRp
YTogb3Y1NjQwOiBSZXdvcmsgYW5hbG9nIGNyb3AgcmVjdGFuZ2xlcw0KPiAgICBtZWRpYTogb3Y1
NjQwOiBSZS1zb3J0IHBlci1tb2RlIHJlZ2lzdGVyIHRhYmxlcw0KPiAgICBtZWRpYTogb3Y1NjQw
OiBSZW1vdmUgb3Y1NjQwX21vZGVfaW5pdF9kYXRhDQo+ICAgIG1lZGlhOiBvdjU2NDA6IEFkZCBI
QkxBTksgY29udHJvbA0KPiAgICBtZWRpYTogb3Y1NjQwOiBBZGQgVkJMQU5LIGNvbnRyb2wNCj4g
ICAgbWVkaWE6IG92NTY0MDogRml4IGR1cmF0aW9ucyB0byBjb21wbHkgd2l0aCBGUFMNCj4gICAg
bWVkaWE6IG92NTY0MDogSW1wbGVtZW50IGluaXRfY2ZnDQo+ICAgIG1lZGlhOiBvdjU2NDA6IElt
cGxlbWVudCBnZXRfc2VsZWN0aW9uDQo+ICAgIG1lZGlhOiBvdjU2NDA6IExpbWl0IGZyYW1lX2lu
dGVydmFsIHRvIERWUCBtb2RlIG9ubHkNCj4gICAgbWVkaWE6IG92NTY0MDogUmVnaXN0ZXIgZGV2
aWNlIHByb3BlcnRpZXMNCj4gICAgbWVkaWE6IG92NTY0MDogQWRkIFJHQjU2NV8xWDE2IGZvcm1h
dA0KPiAgICBtZWRpYTogb3Y1NjQwOiBBZGQgUkdCODg4L0JHUjg4OCBmb3JtYXRzDQo+ICAgIG1l
ZGlhOiBvdjU2NDA6IFJlc3RyaWN0IHNpemVzIHRvIG1idXMgY29kZQ0KPiAgICBtZWRpYTogb3Y1
NjQwOiBBZGp1c3QgZm9ybWF0IHRvIGJwcCBpbiBzX2ZtdA0KPiANCj4gICBkcml2ZXJzL21lZGlh
L2kyYy9vdjU2NDAuYyB8IDExNDMgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDgzMCBpbnNlcnRpb25zKCspLCAzMTMgZGVsZXRpb25zKC0p
DQo+IA0KPiAtLQ0KPiAyLjM1LjANCj4gDQoNCg==

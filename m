Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D991644285
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 12:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbiLFLwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 06:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234554AbiLFLwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 06:52:42 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30D538B5
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 03:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670327560; x=1701863560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G2ImgEXYe/aGpQHedq6YZyHk2PEqc/aGaDbSdnszTS8=;
  b=J6Poa0JwNGQdKpe6kNHOSj5yqyaNjPVj3S5BupFS3kd08WoPJollfVAt
   DULd1qEyQ6JjMYyvdjNQZCgZktISYI8bd26a8aMBABiSy2rDRMARmd9b1
   taphlFoC4V1ftaju77oHNLINIHZN5QfSnqwVC9a/o9iFuT2hiAT1BFocT
   SgX28HXwx270zZAKK6fj7AuqtB7n2/48ctIqVcAZyRHMt3IRw3j4/IsMf
   SIPL9pHrOaFtBQ+Ev2OJzmfo1rtJ1M8uXRErXjdLy99FZvoCIWkmChgya
   UfQDAgnUc5803C5mfidU307STkDaxd1mw9XGob1r/sM2ixScIGDnL11Z3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="317745946"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="317745946"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 03:52:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="639849219"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="639849219"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga007.jf.intel.com with ESMTP; 06 Dec 2022 03:52:40 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 03:52:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 03:52:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 6 Dec 2022 03:52:39 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 6 Dec 2022 03:52:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJRFt9yKtM3drWclyIZsNViyJG3J1wXsn1cTwiftfc/ixu6NexyS2EyuQqd7h+2hiC5FJtDYwMpWUYQi3SNCBR+ey14gxWkk5ff/D+gGqfMNIUe+wyatDh/ItXf5W9UiUDfUZTZCtR0dxZk9DbBCbvntx9HEf+biB6YhNvaU01jPT3vYdsSyOus7pYIo6im2XJI0XsMh7UiVW5DXDF8PCUx2MtlsjC5/F7K7qKHVf0Mdw0PZ8HVo8VSeR1UGbLtZies9MQF/NTYzk/V3OaFoZKKC7CiIvxhDiz7RKqM4H9p/AwSfBB+V2JlsT2y9ZIEFdV3EfBd/fLaMHODMhrfk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2ImgEXYe/aGpQHedq6YZyHk2PEqc/aGaDbSdnszTS8=;
 b=PmHL8cmRTaLlIFJr+tK/ATu/f6sTx29f953OwTeiQhqGA5kIx/k980k93Te00kcGEQHi/oIx93fhtJT/tWk3sR4EySePApWCXo0MjLFuDfeo5Uj6qkUrjhNq9Tqhsqo/h2/jCpPyrDOzuLrmf5trKwutkhGwPl8euDDAUOdP0m16che51Lq5EjKnswbmU3hAWAUSbEMY+EdVfajQcpRp7ZWgSndBwGuzV3qCae69lHloSMFAWh/v6ZpTRamG/HzsKqZKeW9CPjTV8u2ttTupvBRKBn21BFfXsuNZjVj2B4ZWdNTutsM2J8b6yNZcNZnn+tmb6aNGYRdxrldzdJqolQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Tue, 6 Dec 2022 11:52:37 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:52:37 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
CC:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Su, Jimmy" <jimmy.su@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 3/5] media: i2c: imx319: Set
 V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Thread-Topic: [PATCH v2 3/5] media: i2c: imx319: Set
 V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Thread-Index: AQHZCL1t2DbV17F81EqJJ1Jkhhvfkq5gNVKAgACIEICAAAM6UA==
Date:   Tue, 6 Dec 2022 11:52:37 +0000
Message-ID: <DM8PR11MB5653A45A8B1476636638118A991B9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
 <20221205152149.1364185-4-dave.stevenson@raspberrypi.com>
 <DM8PR11MB56532AC6ED60D4503E5AAB11991B9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAPY8ntAAAT2JHypD5M61qDVxiR0Ed-6Hv4WWu0V=P+Wkb3B+vA@mail.gmail.com>
In-Reply-To: <CAPY8ntAAAT2JHypD5M61qDVxiR0Ed-6Hv4WWu0V=P+Wkb3B+vA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|MW4PR11MB6763:EE_
x-ms-office365-filtering-correlation-id: 75f22947-5fd8-435f-2856-08dad7805eeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tHquOc/vrzphvMZg+3rl91x+GbWdpV6XrAgFkbWuvsVbvtlK8JVrYKyUDbb69fi2ZMDanMcOLLLj3PfxA8xprZOTF8FU2JwIfgpADynl6o+iIqODE/bQ1V+YBpcTAkJDCEuLCayNhAxRH9IXvHkwHEHup/sGl42MxZ7m3IFMMiNxLuP95F0twJQN5WLGyjGW7ssrn1BLx+xS8mt5nhA0b3oP7adCa998w51ggEEJpSsAXwMjxinWDpEEMOtaNZ7QUX7Rlz308TP2TiLLNxhmF+jEnbfnWgg02s3PgSMecJwhHBC2b1PRB2g9rmo8zplrHL3JwO13uS3CUM28MTba6otkH1YdjmjcGQGpm01PPDlC7GOcYGiDCoexMOMOCu5qzFWDee/imnU346pSwvi8o638SROgyIU7RldVwPibAG4uZ1No/jWr+3SccGP1KJqSR+AoYwwH/yUETpk3EzifPEonG9LztPGDoKvF9R3Em5IvgOzTrJMXLzH8SMl7sYKFDQ73DaYMaplwim5bi2ipu4n97UU3OaRFYf4DpxsvngMOM11O5aozz4GTnDN7QfBFIQ76yTr/GSWDPL7Ulu5E5RjlFl+xKt4BUbcjMJg/wO81Wo/3Wo7bjx6bP49MvDZRlLyf7XZb/PElg+r582alKWG6IGlw4bwWejPcvKjPcodAm8yCNlXRGbMvTfPr1gUPdiTblT1JYt5goU4zyNnlyrkTTyru7TGjSUYv6txB288=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199015)(55016003)(66446008)(64756008)(76116006)(66476007)(66556008)(122000001)(66946007)(33656002)(4326008)(8676002)(478600001)(38100700002)(82960400001)(966005)(2906002)(71200400001)(186003)(26005)(86362001)(6916009)(54906003)(83380400001)(38070700005)(6506007)(7696005)(53546011)(8936002)(9686003)(5660300002)(52536014)(41300700001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWRnWllJZDhqNFIwWXVPTExKNjk3MHp2c1hXK3pHZDU1anA1OEFjNU03ZytB?=
 =?utf-8?B?czNCZTVUcGJpU205ZklpUy9uSGVuYk55T3hZWVNxMlZYR1l0R0MzNkYyWlNS?=
 =?utf-8?B?OEl3VGtnSDNnUnpZRDZPSWxQTVlYbW1tWGxEVjllL1ZrSnR3MFFqNkhQMGQy?=
 =?utf-8?B?SG95RDl3V1hsaXozN2xqZmorT0lyWGlDZXc2Z3ZjTHphMVIvK05VUEVpT05x?=
 =?utf-8?B?V2tLY0M0V0ZmbzMxcjBGUUt1bVpZeG5YNE5mSmZCYlJ1Ni9hbW54VVBvRUJD?=
 =?utf-8?B?MjZYc1ZIOEEwOElTU3hja3JFeFRzcDdXV2FzaTNNY2VBNEhwS0ZFU3ZyUnhD?=
 =?utf-8?B?S2tDeFlPOXIrK0F3RVFkRkFiYStuUFBnOTNtYTVIbmQwcFhoU2NvTzBCbFN3?=
 =?utf-8?B?TGlCT0hDVXE4ZWYwWFpiU1Rra0h4RVdYcFBzM3k0OXBxczRhbE5GdUtqR3ZR?=
 =?utf-8?B?OTByK1diTnp2UjZ0VHB1N0cyL0dMM3Aycll4dEpqWVczckpBUTd1cENZby9v?=
 =?utf-8?B?ODRsaDhNTlBGZXBzd3hrbW01c1B5cnB1UkY2aGh0NTlQK01QUlA2MkIwTWVa?=
 =?utf-8?B?TXUwempoeVE0SWl3SUxINTRTcnRnSmhzMWlmaXF5N0ZWMlpCRjRkR25lT3hk?=
 =?utf-8?B?RktCbHlMcUxWTUZUMVNYa2hNaklmSzRSSnBHZ2JsZ1NOcVkySXhsaE5PaSs3?=
 =?utf-8?B?S1loZjlrR3BJdlNrNUFtbTVIcGxKWlozVmcwUElsUHg5Q1JYM05xTUdmSmh4?=
 =?utf-8?B?VCtDdGhIbjQxTlhoMmhPVUhMRmpUUis5NjlGUkU5dVNaSDZSVDMwNXFlSlVw?=
 =?utf-8?B?dWVIOVRPdEJDMGVTZWRiVlFUbGdyM28zdGt0aE9xdEs4cEtjdXlVc1RTVEZO?=
 =?utf-8?B?MFkxTUNWVEhQZWN2WExBNFlkOGxsb1k0MmpWdWVwM2xmN2VqaVJzcHZLVEhN?=
 =?utf-8?B?ZmZpdUZYK2VtMndHWm1hS2NEM2NoSVNHRGNwUjVyUlU4UWMvaEMvVDFQektX?=
 =?utf-8?B?VmdsVHQ4aTMrcjVKWWRCdnJBV2lHL3RqQnRyKzd1TW5NbFV6U1FFRUFnQmtv?=
 =?utf-8?B?RjVmTUxJeG5CcGVsZW41TDlKL1B4a2Q3L2pDMFhCaFRhNmd0dElXbDlYRVNi?=
 =?utf-8?B?QXNYZE8wanZYQmdLKzRjY3dLUG1DT2hKK3NKTitlRWNHWVVZTFEvUGNrdjNr?=
 =?utf-8?B?R2tBNjR2bGptTnd6OTRUZVJGZW0xOVVxYlh5NXQvbWpZY3pzM05oaDgyUk45?=
 =?utf-8?B?TFl6OW9ZYzltdFczSEV2bTRFWG9qNHdUejJvd0NDK0ZvRkxURmVYMEJLbCtv?=
 =?utf-8?B?VDFSUGZOcUpXUWRXRGlGVS8xOW5CMDRRZ2hnTDEwZ2dLbDMyY0dibnBZV0Nk?=
 =?utf-8?B?aHY0RTFaNWZDUEUzZitZZUFjWDhKSGZJSWZVR0doNUgvb2NaOUtCL1N5VVZG?=
 =?utf-8?B?U2J2Vm8vdnpXa05ubkFOOHB1ckhNaUhxUGJTYlB6RzFHQ0YxbnU0SkJPV3ln?=
 =?utf-8?B?K0thTm1BVE4yRlNZODF6alNmWk45S3lFQXFyZS9KWE5ocWIza2dmeVlVRVFp?=
 =?utf-8?B?aTVabFVmL3FhYVVmVFN6alBZWXZVTGZOdjZNQXM5dHpJWThGdk1YYTFQWDYw?=
 =?utf-8?B?ZlQvNXNDcUV2YnhaUlZyaEo0cHV6UEpIQ1pyZzZTaG5ibER0dEtQMzlkanZ0?=
 =?utf-8?B?bTRzdkE5SWZmSFE4STluQ3pnZ2k4TVB6YzhYZm5qZnlZTUxpSzBQNXU4dENF?=
 =?utf-8?B?SEJOR3MxcU9ZUnhVdFlmSWVPc0svb2YrdTRXNHliSENJWCtWWk5WR3ByZm5q?=
 =?utf-8?B?NW1KVHhlUG9IenF5QzJ6UDMrRzBlWVhRRGNoSGN2cVdMcVlDTXJvSzFZS1Bx?=
 =?utf-8?B?aU9wS2dsd05IUVJLTUVYUzdVSjFId0dlK2hCMk9TTGtqUXp3Si9DR3hocDRD?=
 =?utf-8?B?T3F2cWNQUWUwWHl0cWl1cGpnRGtPQktzWHd3N1JqUWQ1cmZSNTljZmFsc3F5?=
 =?utf-8?B?eW9MQktSNU14ellKc3Z3Wk9xQ3A5ajdsRWY4NjYrbkZkaVJ1MUU3STA3bUpx?=
 =?utf-8?B?UkdwZ3IwSUVKT0FWd3Y0aURSNFdFL2ptTzFIZUVENzVBKzlCNmxHL1VoRGll?=
 =?utf-8?Q?dWQsYRE09+pADAdltRjxWymWq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f22947-5fd8-435f-2856-08dad7805eeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 11:52:37.4445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2COAbsVQ+NswrEYL8CbNcQyEFrE/ye0XjBbK/ZbJUoxvMQdSsH3HviEm2XRHg+lgRZqvbW7IMhR+D1pPi0UC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U3RldmVuc29uLA0KDQpUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uDQoNClJldmlld2VkLWJ5
OiBCaW5nYnUgQ2FvIDxiaW5nYnUuY2FvQGludGVsLmNvbT4NCg0KX19fX19fX19fX19fX19fX19f
X19fX19fDQpCUnMsICANCkJpbmdidSBDYW8gDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3BiZXJyeXBpLmNv
bT4NCj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgNiwgMjAyMiAxOTo0MA0KPiBUbzogQ2FvLCBC
aW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPiBDYzogUnVpIE1pZ3VlbCBTaWx2YSA8cm1m
cmZzQGdtYWlsLmNvbT47IFNha2FyaSBBaWx1cw0KPiA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVs
LmNvbT47IFFpdSwgVGlhbiBTaHUgPHRpYW4uc2h1LnFpdUBpbnRlbC5jb20+OyBTdSwNCj4gSmlt
bXkgPGppbW15LnN1QGludGVsLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDMvNV0gbWVkaWE6IGkyYzogaW14MzE5OiBTZXQNCj4gVjRM
Ml9DVFJMX0ZMQUdfTU9ESUZZX0xBWU9VVCBvbiBmbGlwcw0KPiANCj4gSGkNCj4gDQo+IE9uIFR1
ZSwgNiBEZWMgMjAyMiBhdCAwMzo0MiwgQ2FvLCBCaW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29t
PiB3cm90ZToNCj4gPg0KPiA+IFN0ZXZlbnNvbiwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaC4NCj4gPg0KPiA+IEkgYW0gd29uZGVyaW5nIGhvdyBWNEwyX0NUUkxfRkxBR19NT0RJRllf
TEFZT1VUIGZsYWcgd2FzIHVzZWQgaW4NCj4gPiBjdXJyZW50DQo+ID4gdjRsMiBjdHJsIGZyYW1l
d29yaywgbGl0ZXJhbGx5IGl0IG1lYW5zIHRoZSB2NGwyIGN0cmwgd2lsbCBjaGFuZ2UgdGhlDQo+
ID4gYnVmZmVyIGxheW91dC4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBzdWNoIGFzIDkwIGRlZ3Jl
ZXMgcm90YXRpb24NCj4gPiBhcHBhcmVudGx5IGNoYW5nZSB0aGUgbGF5b3V0LiBCdXQgSSBhbSBu
b3Qgc3VyZSB0aGlzIGlzIGFsc28gdGhlIGNhc2UNCj4gPiBmb3IgdmZsaXAvaGZsaXAsIHVzZXIg
Y2FuIG5vdGljZSB0aGUgYmF5ZXIgb3JkZXIgdXBkYXRlIGZyb20gZ2V0X2ZtdC4NCj4gDQo+IERv
Y3VtZW50YXRpb24gYXQgWzFdDQo+ICIzLjUuMS4gSW50ZXJhY3Rpb25zIGJldHdlZW4gZm9ybWF0
cywgY29udHJvbHMgYW5kIGJ1ZmZlcnMgLi4uDQo+IFRoZSBzZXQgb2YgaW5mb3JtYXRpb24gbmVl
ZGVkIHRvIGludGVycHJldCB0aGUgY29udGVudCBvZiBhIGJ1ZmZlciAoZS5nLiB0aGUNCj4gcGl4
ZWwgZm9ybWF0LCB0aGUgbGluZSBzdHJpZGUsIHRoZSB0aWxpbmcgb3JpZW50YXRpb24gb3IgdGhl
DQo+IHJvdGF0aW9uKSBpcyBjb2xsZWN0aXZlbHkgcmVmZXJyZWQgdG8gaW4gdGhlIHJlc3Qgb2Yg
dGhpcyBzZWN0aW9uIGFzIHRoZQ0KPiBidWZmZXIgbGF5b3V0LiINCj4gcGl4ZWxfZm9ybWF0IGlz
IHBhcnQgb2YgdGhlIGJ1ZmZlciBsYXlvdXQuDQo+IA0KPiBWNEwyX0NUUkxfRkxBR19NT0RJRllf
TEFZT1VUIGlzIHRlbGxpbmcgdGhlIHVzZXJzcGFjZSB0aGF0IGl0IG11c3QgY2FsbA0KPiBnZXRf
Zm10IGFmdGVyIGNoYW5naW5nIHRoZSBjb250cm9sIGluIG9yZGVyIHRvIGZpbmQgb3V0IGhvdyB0
aGUgZm9ybWF0IGhhcw0KPiBjaGFuZ2VkLiBXaXRob3V0IGl0IHRoZXJlIGlzIG5vIG9ibGlnYXRp
b24gdG8gY2FsbCBnZXRfZm10LCBhbmQgdXNlcnNwYWNlDQo+IGNhbiBsZWdpdGltYXRlbHkgZXhw
ZWN0IHRoZSBmb3JtYXQvbGF5b3V0IHRvIGJlIHRoZSBzYW1lLg0KPiBOb3QgYWxsIHNlbnNvcnMg
Y2hhbmdlIHRoZSBCYXllciBvcmRlciB3aXRoIGZsaXBzIChPblNlbWkgc2Vuc29ycyBpbg0KPiBw
YXJ0aWN1bGFyIHRlbmQgbm90IHRvKSwgc28geW91IGNhbid0IG1ha2UgYXNzdW1wdGlvbnMgb3Zl
ciB0aGUgYmVoYXZpb3VyLg0KPiANCj4gPiBTYWthcmksIHdoYXQgZG8geW91IHRoaW5rPw0KPiAN
Cj4gU2VlaW5nIGFzIFNha2FyaSBoYXMgYWNjZXB0ZWQgdGhlIHBhdGNoZXMgYW5kIGNyZWF0ZWQg
YSBwdWxsIHJlcXVlc3QgdG8NCj4gTWF1cm8gaW5jbHVkaW5nIHRoZW0gc3VnZ2VzdHMgdGhhdCB0
aGlzIGlzIGluZGVlZCB0aGUgY29ycmVjdCB0aGluZyB0byBkby4NCj4gDQo+IFRoZXJlIGlzIG5v
dyBhIHVuaWZpZWQgYmVoYXZpb3VyIGFjcm9zcyBhbGwgc2Vuc29yIGRyaXZlcnMgdGhhdCBjaGFu
Z2UgQmF5ZXINCj4gb3JkZXIgZHVlIHRvIGZsaXBzLg0KPiBsaWJjYW1lcmEgaXMgcmVseWluZyBv
biBjb3JyZWN0IGJlaGF2aW91ciBpbiBvcmRlciB0byBiZSBhYmxlIHRvIHdvcmsgb3V0DQo+IHRo
ZSBuYXRpdmUgQmF5ZXIgb3JkZXIgb2YgdGhlIHNlbnNvciwgYW5kIHRoYXQgaXMgd2h5IEkgd2Fz
IGNoZWNraW5nIHRoYXQNCj4gYWxsIG1haW5saW5lIGRyaXZlcnMgd2VyZSBkb2luZyB0aGUgcmln
aHQgdGhpbmcuDQo+IA0KPiBUaGFua3MNCj4gICBEYXZlDQo+IA0KPiBbMV0gaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvdXNlcnNwYWNlLQ0KPiBhcGkvbWVkaWEvdjRsL2J1
ZmZlci5odG1sI2ludGVyYWN0aW9ucy1iZXR3ZWVuLWZvcm1hdHMtY29udHJvbHMtYW5kLWJ1ZmZl
cnMNCj4gDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gQlJzLA0KPiA+IFZURyAt
IExpbnV4JkNocm9tZSBJUFUgU1cNCj4gPiBCaW5nYnUgQ2FvDQo+ID4NCj4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2
ZW5zb25AcmFzcGJlcnJ5cGkuY29tPg0KPiA+ID4gU2VudDogTW9uZGF5LCBEZWNlbWJlciA1LCAy
MDIyIDIzOjIyDQo+ID4gPiBUbzogUnVpIE1pZ3VlbCBTaWx2YSA8cm1mcmZzQGdtYWlsLmNvbT47
IFNha2FyaSBBaWx1cw0KPiA+ID4gPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+OyBDYW8s
IEJpbmdidSA8YmluZ2J1LmNhb0BpbnRlbC5jb20+Ow0KPiA+ID4gUWl1LCBUaWFuIFNodSA8dGlh
bi5zaHUucWl1QGludGVsLmNvbT47IFN1LCBKaW1teQ0KPiA+ID4gPGppbW15LnN1QGludGVsLmNv
bT47IGxpbnV4LSBtZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+IENjOiBEYXZlIFN0ZXZlbnNv
biA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29tPg0KPiA+ID4gU3ViamVjdDogW1BBVENI
IHYyIDMvNV0gbWVkaWE6IGkyYzogaW14MzE5OiBTZXQNCj4gPiA+IFY0TDJfQ1RSTF9GTEFHX01P
RElGWV9MQVlPVVQgb24gZmxpcHMNCj4gPiA+DQo+ID4gPiBUaGUgZHJpdmVyIGNoYW5nZXMgdGhl
IEJheWVyIG9yZGVyIGJhc2VkIG9uIHRoZSBmbGlwcywgYnV0IGRvZXMgbm90DQo+ID4gPiBkZWZp
bmUgdGhlIGNvbnRyb2wgY29ycmVjdGx5IHdpdGggdGhlIFY0TDJfQ1RSTF9GTEFHX01PRElGWV9M
QVlPVVQgZmxhZy4NCj4gPiA+DQo+ID4gPiBBZGQgdGhlIFY0TDJfQ1RSTF9GTEFHX01PRElGWV9M
QVlPVVQgZmxhZy4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEYXZlIFN0ZXZlbnNvbiA8
ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVy
cy9tZWRpYS9pMmMvaW14MzE5LmMgfCA0ICsrKysNCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJj
L2lteDMxOS5jIGIvZHJpdmVycy9tZWRpYS9pMmMvaW14MzE5LmMNCj4gPiA+IGluZGV4DQo+ID4g
PiAyNDVhMThmYjQwYWQuLjQ1YjFiNjFiMjg4MCAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvaTJjL2lteDMxOS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMTku
Yw0KPiA+ID4gQEAgLTIzMjgsOCArMjMyOCwxMiBAQCBzdGF0aWMgaW50IGlteDMxOV9pbml0X2Nv
bnRyb2xzKHN0cnVjdCBpbXgzMTkNCj4gPiA+ICppbXgzMTkpDQo+ID4gPg0KPiA+ID4gICAgICAg
aW14MzE5LT5oZmxpcCA9IHY0bDJfY3RybF9uZXdfc3RkKGN0cmxfaGRsciwgJmlteDMxOV9jdHJs
X29wcywNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWNEwy
X0NJRF9IRkxJUCwgMCwgMSwgMSwgMCk7DQo+ID4gPiArICAgICBpZiAoaW14MzE5LT5oZmxpcCkN
Cj4gPiA+ICsgICAgICAgICAgICAgaW14MzE5LT5oZmxpcC0+ZmxhZ3MgfD0gVjRMMl9DVFJMX0ZM
QUdfTU9ESUZZX0xBWU9VVDsNCj4gPiA+ICAgICAgIGlteDMxOS0+dmZsaXAgPSB2NGwyX2N0cmxf
bmV3X3N0ZChjdHJsX2hkbHIsICZpbXgzMTlfY3RybF9vcHMsDQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVjRMMl9DSURfVkZMSVAsIDAsIDEsIDEsIDApOw0K
PiA+ID4gKyAgICAgaWYgKGlteDMxOS0+dmZsaXApDQo+ID4gPiArICAgICAgICAgICAgIGlteDMx
OS0+dmZsaXAtPmZsYWdzIHw9IFY0TDJfQ1RSTF9GTEFHX01PRElGWV9MQVlPVVQ7DQo+ID4gPg0K
PiA+ID4gICAgICAgdjRsMl9jdHJsX25ld19zdGQoY3RybF9oZGxyLCAmaW14MzE5X2N0cmxfb3Bz
LA0KPiBWNEwyX0NJRF9BTkFMT0dVRV9HQUlOLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgSU1YMzE5X0FOQV9HQUlOX01JTiwgSU1YMzE5X0FOQV9HQUlOX01BWCwNCj4gPiA+IC0tDQo+
ID4gPiAyLjM0LjENCj4gPg0K

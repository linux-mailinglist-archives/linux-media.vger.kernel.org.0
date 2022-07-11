Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB6D9570877
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 18:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiGKQiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 12:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiGKQh5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 12:37:57 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6902E7A53B
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 09:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlsxjmqVqacwU9SYL9UM9JD3gqeDcKjoOiW1hdkOhhYD3F5BD8G1P1/wNzJ0vYd2PtxVYBQjADBFtwJ+YBtSN+1xMMiTfRzM2MwzuF29ENJ/tOGrV54A0vL7iq+qjVitwsN5dLc81JJal3fE1x7OfSwlB2IMXW0Fbif3619rjteyD3CSxmklqQdD7tG9lSwFL+zEzDvOMwqCS9cROQwdbySTsBEd3kd8CcDvZVfHsw0Bq0vbKxgrluYExf/M5Snuv9kPofGVN278RXOoBZEgk9fwDlcvP3ANlGjrWnNVdepxurAonfo6+pB6soZ+f7F/m4IplP1iDDpkYckqNJm6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHe35JFhVHw6/OeozF7GFo4Uvw/cVrrZin7r6e3bZTY=;
 b=OQ6+jcNKPADk8vRBhorfpvx5YCOxP1RN9WfNWqnirP7LbW8Af0bOWpmG/hDsIP5+3M6Bb2IM0I5X3r7ZLU+MI2z8CElbFhSerLCunahOODpODRUoDx1/gM1hivqN+ga9s9Hl/JtNpruw1ypMrvq+zjIiaGQohfmQTyLKE7HgJasLwp8i3aMcV3GaG/KaZgnd2r05WmOmCXMbDX7PMxeOkaVGzMWE+s/9cTwPqnvUnJrekYiPDayRFMAI9eYkaIw8BK4hkOcXOlL32KKfrwRdhu9m5LMmlnTX3EPiSyM9EuYGV0k0r3+L3FxFhH1/FmxL4tCX8gFSXk08eW4sjHsDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHe35JFhVHw6/OeozF7GFo4Uvw/cVrrZin7r6e3bZTY=;
 b=kf+uN1gC+2dXIy9XmMLoxjJ2iwCwEjfDnQNNjnKkYZvKlA/fbq1j32RIhdpqBhPLMNdk3UTP6seHqTT7+hHb+irOE80TzDQM3oWZPLkyoSGRr/arPsDGtvZ8nVrPpq76GWJhz/lATRTRi9BGcBo7mlbNMRegI60gTc1sr/Hhl9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AM4PR0802MB2131.eurprd08.prod.outlook.com
 (2603:10a6:200:5c::22) by AM8PR08MB6546.eurprd08.prod.outlook.com
 (2603:10a6:20b:355::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Mon, 11 Jul
 2022 16:37:53 +0000
Received: from AM4PR0802MB2131.eurprd08.prod.outlook.com
 ([fe80::dcaa:905c:ff8:1f5b]) by AM4PR0802MB2131.eurprd08.prod.outlook.com
 ([fe80::dcaa:905c:ff8:1f5b%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 16:37:53 +0000
Message-ID: <7f32db4b-7355-ec48-2e9f-b1db6c24a560@wolfvision.net>
Date:   Mon, 11 Jul 2022 18:37:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 44/46] media: rkisp1: Add infrastructure to support ISP
 features
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
 <20220711124248.2683-45-laurent.pinchart@ideasonboard.com>
From:   Michael Riesch <michael.riesch@wolfvision.net>
Cc:     "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org
In-Reply-To: <20220711124248.2683-45-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0144.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::23) To AM4PR0802MB2131.eurprd08.prod.outlook.com
 (2603:10a6:200:5c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da6e3e8d-8021-4ca3-26ea-08da635bb34c
X-MS-TrafficTypeDiagnostic: AM8PR08MB6546:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKoGXNvifDR0bxr1dwqBJBVFblJk8UeT5jMHp75cLeyjNiCBYJscqkWsEmL2DAwUQeAgOvdPEZZMA4uASfxFqeLjnvADo2S5mtwSsX4Ncnj6SzAM8P/go1gtQJdL+TQYUKSox1w7CR4JEpOlq0iSvy5GPGV7QO7RV0sIuDWHSS6iWbYkGIttnfoCiDSD4wGY3ncrma5qlp4JTi7pA3q0hJNTIrM5xR1mqFrkIhZM0+amY5OPAj5mGvrHpD3AoaoDbczG1SbVvl7N7sydnOzYpTjMO83webbRJcCJ+NKnkmxjNZtdixOf5HQRNuoP2DWbRDFE5BUTxVCQp63pLeV3UiZHn44XKnWOdSyRFpuJyGPRQul7ApIbieQUiHtoXIJRy0MS7JlNog4fgAxWseq1a3cZq08JdDboVdecSXFfPlFWgFXCtEg4j9bwxvn98AJeoj6hc8lrCdMvg6ib/QSvxDKwEcdA8r4ZzIljIcvHQGWgv6uHXcp9iz+/AXW6oYOKrebTBOE2n09M0o4Kdam3hE4gjPAklajvA2wCgiLY6KU4dMDdMhe+T9Bhd6VCguMN60pOss+L8rtHR6smwvXl4d+qJ3Tg1J7ZKWIzu/UCko2uGpLnHRJjTYE8Ca+XDcXbAtyX90+/VbkJ5eMjR87Ds6qfepFlwTB8fN2OdR+wt4F9AGx623uY5+acYMcD6zxuZPqGyw2iN/qrbyK4+1BUxgyVM0mVlqRgVXz9Fqu0EF28F7fZYRZfwWr5vT3W5cKR5+1wQ2Hc9DrgsbLTS3PSvMjyPUkjx34+jFX6Fz+Nvt0R3BDvR4ZJIu7vTuIX4C1EItt7ssx4MuR2pl39Qx6WmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR0802MB2131.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(366004)(39850400004)(136003)(66946007)(478600001)(4744005)(44832011)(31686004)(6486002)(38100700002)(36756003)(2906002)(4326008)(8676002)(41300700001)(54906003)(6916009)(8936002)(5660300002)(316002)(66556008)(52116002)(2616005)(186003)(6512007)(53546011)(31696002)(6506007)(86362001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmhRUmE4WWFsTDU4S21KNmFFUmtYUlJUT2FlOFJkbTJEOHE0U1k2OGlZTTdR?=
 =?utf-8?B?OStGMkRzb1YvSGlMblU4VmlQM2MwUXZDQ3F3RzE4Z2FNeWVnK0NMYmhGWUxO?=
 =?utf-8?B?bzdzb01TV0NRREltaXhsSEVmclNFYnV2NVBSZjBLMFU4Y3hGZFFFbDc5di9G?=
 =?utf-8?B?QUNRREQ3L0xjVVI2UUIwZ2U5L000QmVBNHIrYWFhcGs3aDFkNm13UllBNWlO?=
 =?utf-8?B?My93TitkS0VKeC9VdjUxdWxMRlJtNEVlUXQwTXYvUTY2eFFCSEphTysvNHJa?=
 =?utf-8?B?bFV0YlM4VTBUNXpSd3lQZHQxOS9SUU9CZmxUREJrTW9zYmI4SXdmK0JRQnJK?=
 =?utf-8?B?WHNXQmQwQ09Ycy9BN0hjUFNVZlFkS3NxQVROa0NGbnlJRE5vLzNjUkU4bkhB?=
 =?utf-8?B?am42cmkyLzEzNlY1WFdlNkNiVjVyL2xzaG9XT1Y3ZkluNi8rTVlmVXdRYkkz?=
 =?utf-8?B?enlGcHdiNXZvQ29PcmFMTU1mTlROYzhCZUlhdkhoZFJXTzc0eTd5RFRyTElj?=
 =?utf-8?B?SlZOSDhId2FYZHZqcWtVelFzOXZZNmV3RHhXREthcFZOOVpjcFpwMjFwNGlp?=
 =?utf-8?B?dnM1UFBhODY1TU5tSk14WW9ST1FWMzZHaWo5NFJSVnV5SzFIYzk3Yk1rTzkw?=
 =?utf-8?B?QjV3ME5xNU45dXdXL0hjT3IwUlN2R25WSHg2NFJQakdBdUJ2WFNHd2xDaU1Y?=
 =?utf-8?B?MGpFcGRncXMzZXNUcjZ5ZThLand5VHNCSUpWZ2Jjc0JrWmpzVWZ1V0FBb2ox?=
 =?utf-8?B?Q296WGtSeHBTTHhzcWNCVXJ2WW81VGNhc0lWWnEvOTVSclZsb21hNllpdDZa?=
 =?utf-8?B?OEEzTU04SzNxNHhFdURqOWo2ZmRSYm4ra2Z4NHJVWkpJUkJVVWl4MXQ5WlJL?=
 =?utf-8?B?WFo5UzFaRXQ4a0Y5Nktra1BzQnZacERpakI4UmxKZ0p3MWpqWUJKRHUwNDk4?=
 =?utf-8?B?MXFaUGMvL0RmRVYzMWJnekdhRVRvdER1aU85NkR5Z251NGNKcGMvMUJVQW10?=
 =?utf-8?B?SENGNCtST0V2L0dGOUpSbkgydmN3VVZNMzVlRW9BMVk5eU1GakQ0VFZyMlB6?=
 =?utf-8?B?U292ZC9JeFBKT2RJOG1KRHhMNGlQNHRmeFVTK01pK3pPZHB2Y01uRWNUWFhv?=
 =?utf-8?B?Wk1RRkdINzBVUzVsWTdjR2pXOHpEelZtQkw3dCtyK1ZFelJMckFiUHRHNHQr?=
 =?utf-8?B?bTdkZlI2amt1RGttVGlvZ1FvMUZFc2NUbldCQjN1VEdVdUl4b0pVT29IVXhO?=
 =?utf-8?B?R29qT2s4STZibHJhclBqeUd2TVk0c3JCK2NXa3VSNFpTdTZBNjFuREhtTzVC?=
 =?utf-8?B?eDc2QVUyTGI3cWFvS2tOVWticW83bHNrNmhsZ2JxOWYxbnp3U0VWb3NCcXlm?=
 =?utf-8?B?RzlSNXF5SVc1UUtzbkVGd3FjR2dXUWtSdThzQ1JwUW1JQllNdHF4MGtJbWtQ?=
 =?utf-8?B?OUhDWFFDQU5hTzJJeHJNSFRneXNyWDhka0hKYnpmVDk2NXVGVTVJeDQxMHBj?=
 =?utf-8?B?N05kTDVJQ3htU3VvOE1VUXVFbFVRK1ltM3VVZ01WYTgxK3h0THF0cE1XaVZh?=
 =?utf-8?B?RngwNkYyTnlrVzdzcXJyby9EVkVtMXkzQ3NseEtxR284RzFFOHg5ZERkRUVT?=
 =?utf-8?B?bHRkaHdpWUNkREhkbjJURDczZGlHSU9ZWDk4T3NhK2pVOUVLMHM2eVd2b3JR?=
 =?utf-8?B?d0FMZTFDTFhYK3k4TjlUcjVVR0tjQ01IZHczSEFiUUZxczB3Si9QYmthRFpT?=
 =?utf-8?B?dWNwTzRWS2NIckIydFB1UEJ4NTlmaVJpdHhoMjJXVDdiVGtBa2pyZ0tvMTZ3?=
 =?utf-8?B?ZFpEdXhKblZYRUliai9aazVaTVZZcXJ5aDhnYlgrK3Q5TTdVeHl5ZDZkT3JK?=
 =?utf-8?B?NWswSGwxUEg4U1l1WUhsSGVpck1IeEMxN3FuZjVvU2U3VFFYU3Bac2xKUURt?=
 =?utf-8?B?RG9WTXM0TU8wYjdTMG9rdHU3TjdERG4waC9oN1YwYUZMRGFhV214b1p5UTRC?=
 =?utf-8?B?dXk2dkxuK3p0azBPa0JVd09BT2lPVUxZc2RKQ2JxK2hHamU1WmI0QXRsdjhE?=
 =?utf-8?B?ZDJxbHluMjhxNHlVOHNNOXF1MEFuZkRhTmVGUktqZmNuR0t2NGJoSlY5dDRx?=
 =?utf-8?B?YUJVQjVsMUxxeURNQk1lS3dXNjJQTVpjYWhQWGQ1L2VsK21uVHJVVG94TFVS?=
 =?utf-8?B?a2xPZitJbzRmV3YxYkZvdjZ1L0haclJkSm5CR0tXZkh5Rnc4a1p0cFRCcHJr?=
 =?utf-8?B?TXFjT3BzRzJ2VWtoYUkwZ1hTVFpBPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: da6e3e8d-8021-4ca3-26ea-08da635bb34c
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0802MB2131.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 16:37:52.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xg+7pB9GEYYymwVUPBQMvnFeBLfi30XGknKLkP+JwWsyMZopskUuaA/PRbdeQASPtE2YbeCD6Z7kdhZvez91VygFhRDAHU8Y8IDEBp5S7s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

On 7/11/22 14:42, Laurent Pinchart wrote:
> [...]
>  /*
>   * struct rkisp1_info - Model-specific ISP Information
>   *
> @@ -106,6 +119,7 @@ enum rkisp1_isp_pad {
>   * @isrs: array of ISP interrupt descriptors
>   * @isr_size: number of entries in the @isrs array
>   * @isp_ver: ISP version
> + * @features: bitmatk of rkisp1_feature features implemented by the ISP

s/bitmatk/bitmask ?

> [...]
Best regards,
Michael

Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A37095F73E7
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 07:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiJGFU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 01:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiJGFUz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 01:20:55 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65EF115C1B
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 22:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7DjLjrl+xDVv/zpH6UDqfk1iI1XF7C9CtR85usgrV+Waa3dWNxxrmBs0VrEyrGUQFlEkI4YCd6Sr8TVit3zOirMvvNzU3eWenrrI7fPDQ/olrH/paDRwXfqC+PQIvSvaQlgfAhKSpQS63Fcr9TmMbtY3bhe5BUS3Bi0FzagpnBgyJmsaGXFPHmkQJckgSBNJltPpCvR5xZ7ubryC1T5fRJKIMmzd90CFVV3g6VHvd17qhD8SMq0LEsSUQA+mJzyvHnnp7JhYkrFA2vLo5xISMj6I+Wa9T+FKSp/ZXwTX+beLW99w1jLh5fjhV21qP5WMw96Y5N18ByGV6tO7zduzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sf01HgWoUeppdCYJ9tbhKhwBPHat7h7ifPWf5xYbkZU=;
 b=Vn2Og2GXArwZwMvoNj7HEhnj6woJ1Z6xIeHJhuKavOqrKJ3w7ESXqlO537nT4bsHQUhWXqGvgF+ckws+3p8jHiZWFl75MjIf0PriEmblS2nRTz8P/MhUPwWLhVaaXRPuo3lXqZuaAD3eN80H3nYvDled93uzykz/EgiLZnsI34pgtjENzxQmxVom+RosapWqs+Y/q49GUIIY+1eWDVAt92lrbGulwIIyEsAeDE6RIsN3kYRnCRI6aoV4QsZ5DHRwQkvu1pUZPbSHXzqLhrlomX+DHcA1oTHp6hARJtaUrLKIBXqEAiMKTqPTsY08gl5e4Rln4HxaVgi1igF76717Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sf01HgWoUeppdCYJ9tbhKhwBPHat7h7ifPWf5xYbkZU=;
 b=jtShldkJ+80HoDC+0CLsegHrmEEes6fEi+LRc25GHZlAVG9GchDW+DPVf1GoP6PA4VEUwY+LWaX9/8fu6yZCdZjsPo0+VLwSzzjm7XmtC00N/OVwYk93W/+HYgZnPHX9XSnVqmkw0xwXOMwMaD88P64n/XVC0upEhyIunCmLFOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by PR3P193MB0617.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:36::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Fri, 7 Oct
 2022 05:20:52 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 05:20:52 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-3-jacopo@jmondi.org>
Date:   Fri, 07 Oct 2022 07:20:51 +0200
In-Reply-To: <20221005190613.394277-3-jacopo@jmondi.org> (Jacopo Mondi's
        message of "Wed, 5 Oct 2022 21:06:05 +0200")
Message-ID: <m31qrk6wgc.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0710.eurprd06.prod.outlook.com
 (2603:10a6:20b:49f::26) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|PR3P193MB0617:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b786cd-e584-4c13-4fb7-08daa823b3f3
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4vka15YbJY8xW4U/J+zunadoJjkyHC7bCjC6UAN0nrLd+dFeB8ZV3GymZwXCYT7lyxe4gOUMwOhJiQWMGIxKslXuA25FkRAfK4zKX6cnvxWDEZNeH/VphdSkgPo3QED6LsNJLZUL2vioOI79l9XZ6CLk4G0y9NQg3KuNy3KbkeLfENYn89JtZOjV814ZG+1xOaEpFhIciOFp9sAi1dzcrpTGiLi5dHwY6keQShOeHUeRsjBLtvMva5DAxKivxlfYBKAtw4CzxmMyhS7L695Vr9ki3HijWSPp20CCp4057YLRLtyQlvZdvrDFhmlAk4mTQrxnyt3VO1xwu9GTVcAH0novKHTzVK8tS/c7JoyMwLftte5CHsJT6Ej/PlmJWUc+mE8RWxFsE8qB344eI3mV2Gyy86Bt6hqnGBt3ichNeoUEIyisuJV718UsatANDNWfhCRSqMx8TencVVc0xS1G6N6lY31wAgpgPqaj57njUDsc5A+Gvy78Ll84lJTgqpn+HotpeRjIksbRjajvvVDr6n3EuiURFXu6nrc0IAjZu8xdaUHeghJci8utlfgsYKUhBz62V9LNW0ELwRFLKrv9QrZmkVB4hkhW9Ox3iBpwpY64Ql/AYCCyWbSv3CA6oYABkf+sDkZUGs+y+ptKBr2zJtTlRDdShEkRxN7w21mSjr+5WJonn6irl8JohQ5se/DZcfOP1K0H+9U72ZHov4DTmY5NR1jSHNnV8ND1lrMq2hVyP7Z9t29y9Rpks/VqeIYKTMre4rsC9TNrsOPXLsSqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(38100700002)(38350700002)(54906003)(6486002)(316002)(786003)(478600001)(6916009)(83170400001)(186003)(83380400001)(42882007)(5660300002)(52116002)(2906002)(6506007)(6512007)(41300700001)(66476007)(26005)(8676002)(66946007)(8936002)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bERxakwzQlY1UTBTUFhnUG84blBYL0pYMnFveGlER01td2hvdzVqenczY0hr?=
 =?utf-8?B?aE11Z2dLeVBlK3dUMHFNeWRreEJtUlJsZW9nOFcydXZYTWMrazNXSkVNbGVk?=
 =?utf-8?B?UjJuTmlGSDVoSmxLdWFRZlVXcG5pNllPdmJRMzc2QmZmUXB6eGlPdlRSTXhi?=
 =?utf-8?B?TVhiNlNwVmc2Vk1jR2kvQnRScVNRZGdYOURHTGdGNHhuUjFKeFBuZlUrNTNk?=
 =?utf-8?B?UngyaGhhT0xaU29IZzB5KzlpWk14aHlTR1BOUW9WWC9oVk1mbW1mRk11VFFB?=
 =?utf-8?B?NzlPbUFsRE5CclRvR2IycVBjZnQzQS80VEJEZ0F2dDRad0ZxSXlsOUtxS1pr?=
 =?utf-8?B?RnA4eW9wZDh1aldTdERFNkdRa20vaEdmdzd6UW4rbk52SktBSVA0Vng2cG5H?=
 =?utf-8?B?c0tUZW5pZXNUQnRjVWFRTTZ2YWJVV3RiU0VHazcxR3REQ25hc2FXRkhsbkxs?=
 =?utf-8?B?YkUzLzNsSU8yV09SR1I1TmNOVjhzUGh2THdnZ29vZkdCY3hTWWdIejNZNzJy?=
 =?utf-8?B?OVZSaXI1QjlkQWZVR2lubjkxczZBU2xaeThCdHZvTTNTUXVOZGhYTG5uM1lU?=
 =?utf-8?B?c2FFcTFIWnNiOUhPNXJmWEFEUzJDRktMamRUVHgzQnJqNGxSM25EUzMwSTZa?=
 =?utf-8?B?SWljQlpNTnF3KzhXWjg4Qms3Qnh6TTk4RThjZ2toTDc4RVhiVWtMV2JnM3I5?=
 =?utf-8?B?VXl0bTFoMTNUK09WOWhkTXorRjNpVnA2ME5lUGZXM2xqUDBDQUlMaWN3QlhT?=
 =?utf-8?B?ck1aUS9GUDhFYW5iMmRXQXlDRkl0aWQrcU1CWWIwQVc3Nmx3bTYrdkw1bWZl?=
 =?utf-8?B?ekNxSE1tU0h1d1d1b05ub3pDdnZDVENaUkZobm44MGRRNjlZc0RZR0RiYk9I?=
 =?utf-8?B?dUd0UjhKZHVqTzZaY08yWFQrTm50eDlpY2N4bWJKa01xQlV3SE5LQ1Z3RjFi?=
 =?utf-8?B?RG1IOCtmRkJIMy9FdXd3b29PZW1HNVEzVXVsMGZrSjVPeDlBZk9ZSjNwcHZq?=
 =?utf-8?B?SXgxdGcvZ2M3eWd2UURrOHEyczlKQWg0cTdLWWlsK2R1VHM0V2xMQk9KUEEx?=
 =?utf-8?B?d283VFQ5VGd0ZFBSZHloT2YwdEVpME5XZldzNkpVMEVSTFpDUUdJamZWb1Nz?=
 =?utf-8?B?NkhwMlpoOTFCSGNIV0ZDanptYnZ6aWU5ellyMUg0SnZPdU9sVE5WUDc4WG5D?=
 =?utf-8?B?Uk00Lzk3Y2NxMzVWeGNFczZ4ZTcvUkYzclduTDZGV2hQeVFVTVN3MlNaWk5I?=
 =?utf-8?B?S0NFYWlmYXQ5ZWJ6Ui9hQk11d25tYTYrZDdKK0RTRzNNRDBHUWpRRjJYRnZl?=
 =?utf-8?B?ditoZG5wdjlYQnlmQlpSamVEQmdvS0QyRE0vejlQRTl6N0I3cjkwYnBqR282?=
 =?utf-8?B?Z1JZZTZRdnl1N2dpd3lYMzlzcUVZK1NVam03eHBaZjdxMmp1SHdvNUJZckJH?=
 =?utf-8?B?MS9SZmJuNEl3WUtYSGQ4cWp6cG83dW9pdUh5ZlpSb0VvWXJKaGc5QzFWbmhC?=
 =?utf-8?B?blBFTmd5M1g2djAvTmNyYU5yUGgxRFpzRnZ2MlVjQjY5elFucm9TRnd1RWZY?=
 =?utf-8?B?bXFwRHAvSERPUDBDdTVqWEdiTmxDazFhU2tkaXE3cHlTK2g5Umx5U2F6emgx?=
 =?utf-8?B?NEprYUlMRHBKL1lRcWE3ZEdvenRYK0hteGtSV2ZlR3J4eWVhZDBVVTd2cmh6?=
 =?utf-8?B?VkFHZnZBTDBha0FnU2phdmRQU0ltZ0IzdmczUUQvNEZpbHNUMjRUY1J6QTJW?=
 =?utf-8?B?c0d6aFJoVFRDVm1Ybit3UFpyeXk4dmxLQ1dmeDVlS1cwNFdhWEdRa0NUejRH?=
 =?utf-8?B?bTNHcDVvWFc4bC9ZY2FpNGk5UE5tR0ZzSDN5R04wamdFSVVNZ1Z1YWxRcEVD?=
 =?utf-8?B?OGRTZEYzMitxMUJpaVB6ZnhKc2ZDNUY4ZGw2MkZ3YlM0c2kvWkt5dkxid3lS?=
 =?utf-8?B?dm9kUjRsZ2Z6cEYxTnVIN2VSUnYydXJKd2xVbEcvNjV4Z3grWWppTlhzWkVn?=
 =?utf-8?B?VW9HLzBBYXNrNHFVWDA1ZE4rcHEvTFVlRDFRV3dwZzd0Y1VzM3JpKzBvdk03?=
 =?utf-8?B?YjNmQmJRaGZLUTdTRzRsSjMrV0hBRGk3Q0NJZlhjUHpOL3A0OEQxSlVqcHJo?=
 =?utf-8?B?OGd2akNxdlJ4bDEvYW4vb3Q5bWowMEplMldzQlZ1c0g0MFV1VkV0blM4Vk5R?=
 =?utf-8?Q?GlqizUQ8OgpVVPUt43laHXAfsbkxKIDeqXpGF7BzAzo6?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b786cd-e584-4c13-4fb7-08daa823b3f3
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 05:20:52.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLHX4lRfAABKaCLMXbt5HNmuPgzlsl7lVxrZXWyc/RhmJjgGbK+b46naTO0bJ/zV+U7nAZcqGfkolZX99LVLGyk6/JTbSepOM+7c4A9Mo6tCptcGhX3YhPDBstl/U8lqmOwwA3uKk9GHOe8SJlhoAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0617
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo and Co,

Jacopo Mondi <jacopo@jmondi.org> writes:

> +static int ar0521_read_reg(struct ar0521_dev *sensor, u16 reg, u16 *val)
> +{
> +	struct i2c_client *client =3D sensor->i2c_client;
> +	unsigned char buf[2];
> +	struct i2c_msg msg;
> +	int ret;
> +
> +	msg.addr =3D client->addr;
> +	msg.flags =3D client->flags;
> +	msg.len =3D sizeof(u16);
> +	msg.buf =3D buf;
> +	put_unaligned_be16(reg, buf);
> +
> +	ret =3D i2c_transfer(client->adapter, &msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	msg.len =3D sizeof(u16);
> +	msg.flags =3D client->flags | I2C_M_RD;
> +	msg.buf =3D buf;
> +
> +	ret =3D i2c_transfer(client->adapter, &msg, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D get_unaligned_be16(buf);
> +
> +	return 0;
> +}

Why not simply use a shadow register?

> +static int ar0521_set_analog_gain(struct ar0521_dev *sensor)
> +{
> +	u16 global_gain;
> +	int ret;
> +
> +	ret =3D ar0521_read_reg(sensor, AR0521_REG_GLOBAL_GAIN, &global_gain);
> +	if (ret)
> +		return ret;
> +
> +	global_gain &=3D ~AR0521_REG_GLOBAL_GAIN_ANA_MASK;
> +	global_gain |=3D sensor->ctrls.ana_gain->val & AR0521_REG_GLOBAL_GAIN_A=
NA_MASK;
> +
> +	return ar0521_write_reg(sensor, AR0521_REG_GLOBAL_GAIN, global_gain);

This one is simple: you can't write to AR0521_REG_GLOBAL_GAIN.
You can write to individual color gain registers (any will do for analog
gain), but writing to AR0521_REG_GLOBAL_GAIN will reset all the digital
gains as well. Reading the register doesn't give you anything
interesting, either (the analog gain which you overwrite anyway).

BTW ISP can't really do that color balancing for you, since the sensor
operates at its native bit resolution and ISP is limited to the output
format, which is currently only 8-bit.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

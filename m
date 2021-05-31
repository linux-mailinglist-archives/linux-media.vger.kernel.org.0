Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05253955B2
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 09:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhEaHEI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 03:04:08 -0400
Received: from mail-eopbgr130092.outbound.protection.outlook.com ([40.107.13.92]:39614
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230104AbhEaHEG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 03:04:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGfAgK4YvChLnixEQu4uGo+mkjcrRPBkWufv0MROvqyJhs9Co6qR9JqND9nHFJXhirSnGEoyM9nRXvj1dA4NYHDDTNORDe9ioooNUSXz09pvdnhudkwk2ErA/YV0rq3wnzJrPJ/292pfowQM7/mfeAFwVFp84g069tsGav/FXZ25ZDeRrh7B1X+HI9JnotiRh25sJ64ErBXeWl8fOI5f3gfB7ZclQ79Zgv225pqqeniLl2etjhYMOKzQixbj6xzOEaHwrbmK5ekSwBadZJDEwohBb/stRohJIPnIebCn1onP3CuzNtfIMD/lgtbIv4n2FHopZqixln2MPltWEVcPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFyA4EBBYQm2ryC5q0FDxBBYWRxWcolP/Fov7ur+sj8=;
 b=kaOYPMZzpc6ODwWc0Rf2IFtCvmBs6yjSS6JnUjGE+F+hkCdQnhRrvUaEqBI8h/LT/SZsFuDhTDRkhbP1aiD41mCUtUukDESgVGqg1CCWmxNlKGvi3uVBkyVI8w7+TG/9y4YDMqm0csJwgLicEgxqJj8G5jxfy/Tvl8H4lr93oEdFWNOGAbr9VzixA6myC6repqQfKHCark7HV62MNkhIl1RiepvbLTjetnQtJijXqeqE0QKAJD15QM8vUHyMAFwVRfipJQHxYqQt1ZhxOhRq+sC+7lTBaBBxlfxDkAi6+9RIT+1sBVVxuNyQnF09DNrHoDK3rbruYFUyoGDZWWVs3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFyA4EBBYQm2ryC5q0FDxBBYWRxWcolP/Fov7ur+sj8=;
 b=aZhLKH1e2D29h800siL9xWgbNnz4dFv5V51QD0XObeeG8cPRmoFp2wQ7kX/O/ksAXtcEOAAAQNyu9rXg6M0QSkRFQHdOQPVfg8MEwPlNtyYY2QIjA7dq0neMQt1tv23WLjsD0vEs1iQ9qzFjMOjGOJo7a4MlRMS/3bapumIxWGc=
Authentication-Results: ragnatech.se; dkim=none (message not signed)
 header.d=none;ragnatech.se; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM8PR10MB4802.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 07:02:24 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 07:02:24 +0000
Subject: Re: [PATCH 2/3] media: i2c: adv7180: Allow the control of the reset
 pin
To:     Fabio Estevam <festevam@gmail.com>, hverkuil-cisco@xs4all.nl
Cc:     lars@metafoo.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, tharvey@gateworks.com,
        niklas.soderlund@ragnatech.se
References: <20210530204410.676831-1-festevam@gmail.com>
 <20210530204410.676831-2-festevam@gmail.com>
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <0e5d7662-245d-d87b-c0bf-3cd0171af527@kontron.de>
Date:   Mon, 31 May 2021 09:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210530204410.676831-2-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [89.247.35.100]
X-ClientProxiedBy: BE0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::18) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.32] (89.247.35.100) by BE0P281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.11 via Frontend Transport; Mon, 31 May 2021 07:02:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0536cec0-c913-4ff5-1100-08d924020b00
X-MS-TrafficTypeDiagnostic: AM8PR10MB4802:
X-Microsoft-Antispam-PRVS: <AM8PR10MB4802FE4791D0258D76D25271E93F9@AM8PR10MB4802.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4bbeeikHm3pudFLiFhm6Gi2TxgvnOkA/2JcJYn9LTNq9dK7Ke33uSu+hup6K1mssYa2MSJUEMsQVbUScvQJhfUulRaUS+GafT0m79bOCBN6x9BGUZ+k9LGhCQ6iAvozr1rX6Omhaj2vUQQliZA1Iqfcoc/+M04C3dp+JkrSI1QK0U173FYgOB5OpK2kvWWzAxY5QATpD8sbGs3hvKQ3lEDVxSeXUKCgBWhjTHEYL/c+hwcchIShNRDxkEPfOQqAbvbFX6O3E/KE0KGZ2vv2bomVrjwU1ZsT0Q92qK8RoQ9LLuftj5UT9Hc2+yVuTey12GXCfIu6umFewKYbUUeB5GWN2T2AnMf2ucP8wr7HSBrV7sZn0b5VelSOJPYnJmx8VSHOFyBQndChcx2OqwhIuNzmWw/xE+KNSqKMf01TfVux3VoAqGKn1HPemz9fMvQZD0S4c2RSNzgkPIhN/8oLjUu/X+edVruEEp8z5HmWSv0mrK0YjSRYOJ96X24kzD/kMFSkleM3LGFFcqkKwdGxrCShFDL1WGhEGWPwJvGDluJ42KheL5TZR3c7gmvlGKEuiXOeKR6h0LqKeJQX1282JAOXRopVp5yzAmshA5y0DUUYqMERxJ7VIGy6fpq1ZmJ0+eE5/AahGG6nM1Lod+Ce38UfWX3AwUGTjkgmJkZ9QbTOmyoc3JEgCQ4kkM+ZZ+sZlCU0EZa7zIFt0CFODhCJnfkGcpfFmAEKJN8Rp8U2r4fjeCvXAsH4/osRueJc4Dqx5Y+Q3Sa2ROPXNGtuUpz/8dWPtmyRSw6vtktvKl+3aNEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(136003)(396003)(346002)(966005)(478600001)(8936002)(16526019)(8676002)(5660300002)(186003)(44832011)(66476007)(4326008)(66556008)(83380400001)(31696002)(6486002)(31686004)(66946007)(53546011)(316002)(16576012)(38100700002)(26005)(36756003)(956004)(2616005)(86362001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R0tiNnlwWEdmUlVwU2VRZzFUS2xtcUl5cEUxOWd1dmZzL3VHR2Q2Q1lNL0Z6?=
 =?utf-8?B?amJ1V24rMzFOZGVGNUJUYW1adE1RR0luTzk4RGhKU3lCSGh2bnMvem5UT1k4?=
 =?utf-8?B?cGNNamFtd0xDMk0zVGhwYWhBQ3RQcE5RWVN2RXlHK2JGdmg3Z3JrY1hPVmN0?=
 =?utf-8?B?RWhTVmV1NW9PM0hQQlRwamF6V2pjL1I0SlJUNzhTclU0cCtHbmZuKzdRSmNi?=
 =?utf-8?B?YVpucVd4dFBaOVJmZ3A0SlE5STJNSEJuQmpPaGl5ZlFFSmF5aDR0MjlDUlFT?=
 =?utf-8?B?aFVLeHdnOE5qUVBVd3NVU2xVZGxFRVFtOGpOUUhRYW9ucEVRRnZad3hWMjFN?=
 =?utf-8?B?NHR4SHIzOEIyakswZSszRTdlVTBpUnJXTENCalAvelZkVmhOZm54RzJkOWR4?=
 =?utf-8?B?QUxyVi9mM2xnMW0wdmkwS1RBY3plTjdJTEJTZVNBb0Q0WUwzUkdIWFVLTFNG?=
 =?utf-8?B?YzRBTU43ZzlLZDgxcENYS1ZSZ2tlYVkvS00vczUxUlNyNnFuR1lyQ1h4ZWJJ?=
 =?utf-8?B?QUM4aFhSSjhualVaZGlmUmFBSmNhejczbU5mY005L0Y0SkxmVFBWaGlDNXBs?=
 =?utf-8?B?REwwd1ZZVzVhMzBtb2Y1YjV4QS85aG53SkNqVGJUTmkrNllmalVMUWVEWVQ2?=
 =?utf-8?B?TzVhSHhhTENlZXJPeXhhVFNOUU1hN3lNSFRRSmVUdVRjUXlFUkFqTDlZZzgz?=
 =?utf-8?B?T1E1T3lQSngrZ21vb09tYzMvL0srbU9LcHRSUTFHSnhNaXdnMkJZczNVMDhT?=
 =?utf-8?B?RTZFSjMrV3FXMTVCSk52NUFZN0J6WWhrM3IvMi9hdDlBZ2V2eERLZTczVWds?=
 =?utf-8?B?TmFGREllU0RnQVJzNHZKdWp0OEpKeEJ6ZXRrMWtnOFpjNlpCU2M0V0YwaGQ5?=
 =?utf-8?B?bDNrOGlINHRBZGhxK2xNektYZHBMYmluSlFkbWZOZ1NWMDlsbTRzMmpaRkY3?=
 =?utf-8?B?SEFJZnZwd3htRi85a0VnQUNXOW9ZU3BmZEh2dnJmbTNIY1N3cHNCOUhDOXdL?=
 =?utf-8?B?eklCbS9QL1FsWXp6bFNTUUhOSjlLL1NkQkd0WGRobVFwdUhJVGJuK0FWcHQ1?=
 =?utf-8?B?NndIdndBZDZwSFVISWlOcEV1b1FYYkh5L1pHa2xyVzQrcFhZY0Z5cDR6OU5h?=
 =?utf-8?B?U1dmeHA5ZFRMNVdpdVJBT2JIMTU1dkpQeWFhc1R1U21DenZSTDJYVkI3TEhT?=
 =?utf-8?B?M2pwQ1hMRVhydVZzSTkzLy9nbC9CN0FOSTEzUzhTQm9QYmpEeURxWDk3ZkJk?=
 =?utf-8?B?K0tNRGRrOTZSVFFwa29sOVE4aHBaVDhxVU5NRjRjaHpLa0lPK1d6bXRWSWFD?=
 =?utf-8?B?OHFTY3ZOUjlWU1EzOExwTW5zRHZ1c2tvR0d5UVlLNFJhQ2dBSlVnaW43aGRz?=
 =?utf-8?B?TEcvVkhKODFWYS9jSng2elhJbzIxN0FWOUwzcWJ2Nmp6VDZlak1PeEV3ckYw?=
 =?utf-8?B?Y09VcjNvVzhiMk5rc0czTmV4Z0hRRmRYbUpFaHFXTSs0YTJzMDlYWUloeE40?=
 =?utf-8?B?TlJaUWZmTEc0OXV0MFFqUzY5eGZBT0tQZlY3M2h1RTFTNUQvaWI5U2xHRmI5?=
 =?utf-8?B?RitCNStpMjBRNHBJYkJ4RTRrWGQxMmxsWithYXZ4bzVsL2MyRVkxOUs4V3JF?=
 =?utf-8?B?ZUtub0JEZ2dBOTB5Zy9Ndi9tZ1c3TDV6bjcvU0QxYWRvNllnY0Rodk1uUi9l?=
 =?utf-8?B?UXNzTWwxVHc1ZFFpK1lyRnFPOXhWUzZ4NUFMdms0ZDlMcnB3ZHlyalcxU2NW?=
 =?utf-8?Q?xfdlLNMVXOzEbIqcuAoE1MJZsDbt86pkQuj0KoS?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0536cec0-c913-4ff5-1100-08d924020b00
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 07:02:24.4453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwutVZ9ClNnIzsBVtE5X32rkT3V+53hfQ5/LkM8iMB0ebal3h8J6lrry9TYRFJNodq2Sju7FBLgDs3fO9qlbCi/knAL8mZ2W75yub1578Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4802
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30.05.21 22:44, Fabio Estevam wrote:
> On a design where the ADV7180 pin is pulled down, it is not possible
> to make it functional unless the GPIO connected to this pin goes
> high.
> 
> Add support for the reset GPIO by introducing an optional property
> called 'reset-gpios'.
> 
> Note: the reset operation is still performed via software as recommended
> by the Analog Devices, but the reset GPIO still needs to go high to make
> the chip operational.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/media/i2c/adv7180.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index 44bb6fe85644..2811f2c337fa 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -205,6 +205,7 @@ struct adv7180_state {
>  	struct mutex		mutex; /* mutual excl. when accessing chip */
>  	int			irq;
>  	struct gpio_desc	*pwdn_gpio;
> +	struct gpio_desc	*reset_gpio;
>  	v4l2_std_id		curr_norm;
>  	bool			powered;
>  	bool			streaming;
> @@ -473,13 +474,15 @@ static int adv7180_g_frame_interval(struct v4l2_subdev *sd,
>  
>  static void adv7180_set_power_pin(struct adv7180_state *state, bool on)
>  {
> -	if (!state->pwdn_gpio)
> +	if (!state->pwdn_gpio && !state->reset_gpio)
>  		return;
>  
>  	if (on) {
> +		gpiod_set_value_cansleep(state->reset_gpio, 0);
>  		gpiod_set_value_cansleep(state->pwdn_gpio, 0);

The datasheet specifies a delay of 5 ms between deasserting the PWRDWN and the RESET GPIO. Also this function is named adv7180_set_power_pin() which doesn't fit anymore if we also handle the RESET GPIO here.

As I was recently working with the ADV7280-M, I came up with a similar patch: https://git.kontron-electronics.de/linux/linux/-/commit/3619ed166140a0499ada7b14e5f1846a0ed7d18d.

What do you think?

>  		usleep_range(5000, 10000);
>  	} else {
> +		gpiod_set_value_cansleep(state->reset_gpio, 1);
>  		gpiod_set_value_cansleep(state->pwdn_gpio, 1);
>  	}
>  }
> @@ -1338,6 +1341,15 @@ static int adv7180_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> +	state->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +	if (IS_ERR(state->reset_gpio)) {
> +		ret = PTR_ERR(state->reset_gpio);
> +		v4l_err(client, "request for reset pin failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +
>  	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
>  		state->csi_client = i2c_new_dummy_device(client->adapter,
>  				ADV7180_DEFAULT_CSI_I2C_ADDR);
> 

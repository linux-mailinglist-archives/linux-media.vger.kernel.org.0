Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273B34A800B
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 08:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbiBCH6t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Feb 2022 02:58:49 -0500
Received: from mail-db8eur05on2081.outbound.protection.outlook.com ([40.107.20.81]:61025
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235157AbiBCH6q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Feb 2022 02:58:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUsf1uLBLVdf9mk3Jc00jfQ0XsSpCgqVi4hd8viMdWveLxtodPnYgbK9qRwpni61kiLpyNJP5fAhpN01t981WXcHEOsMtsuPF4t79EjWXItTloSCwnniHPySN90H4QqNF9zV4eqq6KQZaSSIIomYDwibnvdTiz1U/+eJCdoZYJK2kVdC8ryWt4mh8G9Dp0tqb8miIewbu+mLV2vA9E1OXtktNged7edM9XqJ5UV/0ojeW6b0BOqsy6lPNoz0ONSqVdwt1vV3vYmnErsy0fu9srpNvuEBtEGoOe0r+FpMlP3lR82Mfm31msBVkjmpu1YKSAmzIYvy8haWzu/KYduKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OP5LH80XC1rAHyUjEnwMO8Vlxx8oV1a5keProBrJqY0=;
 b=PSzoUfE3mAqNf8Y1LntpYFq2W8yZOLhdfpjVXSZPny6b03Lhqx1eDR70nwrGEvV95a8D7h0odnyixBA2quXVOQ9cusiUN/grsfAhQ5jcm2qGMf340UcuqZK7oC9BkUErYYlYAvO8x+hLmqB+e+yH45y9lQH8gHvE0haiZMpUjQ+P3a6w6WTLUtL89EbUiP7E9xwz6/vXBmYnUISqrGcYF6igSkBhE73wW6oIidkWhBxsGWI1PjZW4CiuyKD7a5GsTNhInBSAclxHT6o7ITtvLMzp5fGPpOCyo4Irv0yWBsuWXBTlYW96QL3Z/9HdaB35nEAexxufX1YwfYF+iJfNWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP5LH80XC1rAHyUjEnwMO8Vlxx8oV1a5keProBrJqY0=;
 b=K8i6elB2ZYAzJoCNsEFhsqSR4rBh39mrDAZ0qMHERd1uUNQ6oOvbAtxgYu9KJcsINIDrd+qQkO0AmqWdgVe6ENEDmKqCaBJ3/Ibx5eQ8eXYi3x5V2AYafE51253ty2eBTrLB1oq73U1UkOXsFkqICbSqErUM68kR/olBbWcXDAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR04MB6334.eurprd04.prod.outlook.com (2603:10a6:803:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 07:58:41 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::7881:996e:26b7:92ea]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::7881:996e:26b7:92ea%4]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 07:58:41 +0000
Message-ID: <b6394f46-d379-5577-9745-7093abfd7ea6@oss.nxp.com>
Date:   Thu, 3 Feb 2022 08:58:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/21] media: ov5640: Add VBLANK control
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        hverkuil-cisco@xs4all.nl, mirela.rabulea@nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <20220131143245.128089-1-jacopo@jmondi.org>
 <20220131143245.128089-12-jacopo@jmondi.org>
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <20220131143245.128089-12-jacopo@jmondi.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a7b467f-d97e-43c1-31b2-08d9e6eafdf3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6334:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB63348FD26DB26D7EFBB64042BA289@VI1PR04MB6334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:106;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7fIYeUM9L3m3Wlk1Urx8cfW9an9o6jwHiZJxtabNHb0CEFMJaViYJS+5TEe7EAtCBtDUq7+h09Jvqc5xNty1GDLrspKAUGf3gymaI6643DLBI1ObgXu+C9V04vRmD+R9M7iYT04HEQLORpmeW2UhBB4sErnSoEQbUOc1pd0mmJ96uLRMbGfO+PYyIet2fBBkP/2trjOqcx68m+ZPIysM26NPHDZBaMmJL3wlOdeSnEPHPYUqif575akDt6nBnZWX0ZchwCe83HgfmmDYC+hlRkqW/ZAvAW28jMLv6LEmXXpiC71j1ank91W48PvrN/vsNe3JaKrff6qda+vP/36q/h4giwjs7fa5rhcVvZs5orLv2TTbpUO8l6sQsqpmnHNBW0zgvsSbNAdeZ3QQrmnpRW5l/w74nBX4q2zzKaNih38L7ZTEQC6Z8UkQWORnhl9t1CzzCxyHujL8By/V8+3lB0Du1y0URoXyw9zJldXAP8ikTNsCGSmqW8ROFaDsckdwXF3ms+qa46wPY8YyIfwB9/7sDyjiy7bjyqRf29xjrj9JOp7K9SAlsoT2ioYuvZdSFN5CKSOldhlx3E5nSfMIQe71BiPq/EYQIkhYHHuNgL2piBJzVw7SXVGrEmWczmDxxdL9PeUe/yX7ry71u97cCfz4dBoWF/oJIaS+Yyw1LCjBCasClG+9Q9L1CL/xX2DKEDIE+hCDsjXw+Jr+l4C+nBbn8uhuTcvFoukYCRQqFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(4326008)(508600001)(8676002)(8936002)(316002)(31686004)(2906002)(110136005)(6486002)(53546011)(83380400001)(6506007)(6666004)(6512007)(186003)(66476007)(66946007)(86362001)(31696002)(7416002)(52116002)(66556008)(38100700002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEh5WVhqL0NhQTNBdTVvOER3OG5HdlZFNGF1TVFhM0NlRXN1dzlpZ29FTlhN?=
 =?utf-8?B?TklaeE5LUGlLaldyc0lDc2tRV3RJbW9IUzhIQ3pNM2IwRWZlcE1VNlRFa3Yy?=
 =?utf-8?B?VERKR2FYVFZocGZLQjBNb2NFRDFnSGtIaVdWS04yVkZQZEV6TGFuQUFRMnM1?=
 =?utf-8?B?NzMrWUczN1ltK3JXM1hIUGJ5RE1KTklWdEwwRmI0K05obEhmMWZMeUJTM2VM?=
 =?utf-8?B?Tm1pWnhBemV5VkIvNXNvVS9oY0RWVU5iSURVWUVISzRNclFGSnhNZGEzOS9U?=
 =?utf-8?B?cDZ1bXdiNjlFVTRUV3VQdktoWm9OazlaQnh4NGhEMjB6M290NjR1MjFycEFQ?=
 =?utf-8?B?MWx1U09JZDdjdGlTbFFQSWZSQlhZUDhZTXlhNjFyUnVydWsrb2dMb3JKMXcz?=
 =?utf-8?B?czlSNWE4dDU3aUxySnVNTTVRUVBOc25PS25IWnBiVG1veXNLbmNHS0RlQUc0?=
 =?utf-8?B?WWdMckgxakpQbVpFK1IzYzk5Y2k2UDVTOG1WR0d4VWlGRXRCK0h2WjZ5Ympz?=
 =?utf-8?B?V2phbm5kN2pxZGV6a3drNENOSmxwWWZJN2JXZHl1bzhBSHpsdWVkOFp4QldN?=
 =?utf-8?B?WFAvN0l0aVBsenArTWxhblYxd2ZrTE1Fcll0d1hPNXhncTlaTUZIUUxqQWVY?=
 =?utf-8?B?YTNTeTFhQUN2TzZnRy9TSFA5M1BFT2RFamZYdThMcDJnWmFvbW4zSnBSUmJz?=
 =?utf-8?B?N3ZSMHNLREM5KzhEZlJGSmJycTNOQThrOU1LelZiOTRXQllraDBjOUJZeHlU?=
 =?utf-8?B?VFF6ZDRCNENXOFBBK0lYdmdObDJKampGQ09vRVl3dlUyK3dkbXhVTlVNWnhn?=
 =?utf-8?B?ZnJoOU1JVmpZVjBKbzNNRjNFYTArOWplT1BRZ0VKRi8wQVBHZWVwdWRpU2Zo?=
 =?utf-8?B?T3gzQ09NODFpRmdoSGJBdDl6d292RjBESTROWmIzY2dLeUpSZk9zZVlSNXh3?=
 =?utf-8?B?SjFhZ081V1YxMXlPZXlGTkhHOUNLZkRWWnFDWkp4MmVGa09DS1FJcXBnakxH?=
 =?utf-8?B?VWFzUXAyVWVzZ2I2Nkt1ZlIva2lBTVpWb0k3bDgrcm9YQWpkNlZKMDYzOUNP?=
 =?utf-8?B?UThKRFFDelRLUVJZYkVXUkhJRDMxaTZXVFE0TGFha1ZCcXZPbkJCWHlGcWcw?=
 =?utf-8?B?TWRFOVVTSGU1dXpCcFF5S1h5Zldtdjk1NnJITTdmdHRYMTlYVlpSRlNFVVBw?=
 =?utf-8?B?TG9kOEFScEFudEtnNnlYcU4wSGFQUE1EVHlwT3RHeXhJYnFjK3pDY015MHQ0?=
 =?utf-8?B?MUIyVmo5NWFLVmFySkt0TU51S2NDekxadWxTZHVzMWtYNlBXNjhVTDlNbzJP?=
 =?utf-8?B?TXRpWmllK2U3UGxPbEdrQTh1Yjk4N3g2Y0hzeGlhMm5NVy9TcjUrb0pNS0hS?=
 =?utf-8?B?Q3JCMjNET3IzUTJRRm80Yzk4UDVIOXUxN0RPWU5sY09oRzVHQVNxbW9OeXA3?=
 =?utf-8?B?djhLRW54VEJYam84eGZDWkZVeXNqOU9VVEtIL1h1UXZHVzQrQnFoVEg2RUdG?=
 =?utf-8?B?SmM3N3dDd204VUZnUVorN0RrV3JKZDNYamlYS1AyUTQvdEV5QTJ1b3J0SmNu?=
 =?utf-8?B?c010WFNTWnVDTGx6VkcydFVLanRuOVVCQzRJZ1BMZTJGaWxIZkJ3V2JvWHlV?=
 =?utf-8?B?enlzNVhER2ZCRFhiUnc1a1BjNXExYnpzL3hlc1ZRSk1RU20rN0JyTWJmbkh6?=
 =?utf-8?B?djhkbi95TmdwcW5ONlA5TVBMMkk3a29icVM1MGMxUzhyR1l0UExkTDNFQkxz?=
 =?utf-8?B?cnRZODBScmJGYXJIblFPWFI4cWdESzQzMUVKTDB6ZXNsRlBMWG9jZW1LUEpj?=
 =?utf-8?B?K280cGhydnZuWTEzNFF2MHNnTEdxb25mVnQvWFRCUzhmTXZJM29Wak9OcmF1?=
 =?utf-8?B?MlJRMEU4TWhIdmpWTHJnNFVsek9PcjU3UDdUMGJwcmJMc3kwTWlnSGc1OXdw?=
 =?utf-8?B?OU9rMnU0YmFaZ3BMdjIxMjgrZms3RDV5TTF0dUNRa2tPNUZaTFplYXU1YUV4?=
 =?utf-8?B?c2ZtYldzL1grNW1vclFERXNwSlUxSHorMlp6ejFTY3B4aGx2WS9FQUZkWXpY?=
 =?utf-8?B?R1lKaWE5UVVTQi9yeVVTd1FqOW9GUExiUmtqcjFocjh4VG9NS2xPUlpWMWxW?=
 =?utf-8?B?R0V5RHR4d2NQK1lwb0JaVHMzbjRWdGFCWFAyOWZQbjhUSFY2QnlxbWpraWw0?=
 =?utf-8?B?V2ZYc2VsWTA2Mlh1UDFrOE9Lb2NBQkRhNVhTT1ZhS3RsU2tWQ0IyNFVsRnJr?=
 =?utf-8?Q?KlPvdn7W3GYNgwV4jWO+lW+8XabdLfROp5QqlTWLh4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7b467f-d97e-43c1-31b2-08d9e6eafdf3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 07:58:41.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTrSR4/ct8NYnYtbja321cldDuzTtm8bIq+1LhbbrX4qdST2N6RU9QEl4KW3CUObQR4qaQgPElYAkWHdsSDVQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6334
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jacopo,

On 1/31/22 15:32, Jacopo Mondi wrote:
> Add the VBLANK control which allows to select the duration of the
> frame vertical blankings and allows to control the framerate.
> 
> The VBLANK control also modifies the exposure time range, which cannot
> exceed the maximum frame length.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>   drivers/media/i2c/ov5640.c | 50 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index b2961e8e07c3..6eeb50724195 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -31,6 +31,10 @@
>   
>   #define OV5640_LINK_RATE_MAX	490000000U
>   
> +/* FIXME: not documented. */
> +#define OV5640_MIN_VBLANK	24
> +#define OV5640_MAX_VTS		1968
> +
>   #define OV5640_DEFAULT_SLAVE_ID 0x3c
>   
>   #define OV5640_REG_SYS_RESET02		0x3002
> @@ -267,6 +271,7 @@ struct ov5640_ctrls {
>   	struct v4l2_ctrl *pixel_rate;
>   	struct v4l2_ctrl *link_freq;
>   	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
>   	struct {
>   		struct v4l2_ctrl *auto_exp;
>   		struct v4l2_ctrl *exposure;
> @@ -2531,6 +2536,7 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>   	struct v4l2_mbus_framefmt *fmt = &sensor->fmt;
>   	enum ov5640_pixel_rate_id pixel_rate_id = mode->pixel_rate;
>   	u32 num_lanes = sensor->ep.bus.mipi_csi2.num_data_lanes;
> +	s64 exposure_val, exposure_max;
>   	unsigned int hblank;
>   	unsigned int i = 0;
>   	u32 pixel_rate;
> @@ -2586,6 +2592,20 @@ static int ov5640_update_pixel_rate(struct ov5640_dev *sensor)
>   	__v4l2_ctrl_modify_range(sensor->ctrls.hblank,
>   				 hblank, hblank, 1, hblank);
>   
> +	__v4l2_ctrl_modify_range(sensor->ctrls.vblank,
> +				 OV5640_MIN_VBLANK,
> +				 OV5640_MAX_VTS - mode->crop.height, 1,
> +				 mode->vblank_def);
> +	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, mode->vblank_def);
> +
> +	exposure_max = mode->crop.height + mode->vblank_def - OV5640_MIN_VBLANK;
> +	exposure_val = clamp((s64)sensor->ctrls.exposure->val,
> +			     (s64)sensor->ctrls.exposure->minimum,
> +			     (s64)exposure_max);
> +	__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +				 sensor->ctrls.exposure->minimum,
> +				 exposure_max, 1, exposure_val);
> +
>   	return 0;
>   }
>   
> @@ -2958,6 +2978,15 @@ static int ov5640_set_ctrl_vflip(struct ov5640_dev *sensor, int value)
>   			      (BIT(2) | BIT(1)) : 0);
>   }
>   
> +static int ov5640_set_ctrl_vblank(struct ov5640_dev *sensor, int value)
> +{
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
> +
> +	/* Update the VTOT timing register value. */
> +	return ov5640_write_reg16(sensor, OV5640_REG_TIMING_VTS,
> +				  mode->crop.height + value);
> +}
> +
>   static int ov5640_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -2988,10 +3017,22 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>   	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> +	const struct ov5640_mode_info *mode = sensor->current_mode;
>   	int ret;
>   
>   	/* v4l2_ctrl_lock() locks our own mutex */
>   
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update the exposure range to the newly programmed vblank. */
> +		unsigned int max = mode->crop.height + ctrl->val - OV5640_MIN_VBLANK;
> +
> +		__v4l2_ctrl_modify_range(sensor->ctrls.exposure,
> +					 sensor->ctrls.exposure->minimum,
> +					 max, sensor->ctrls.exposure->step, max);
> +		break;
> +	}The kernel build reports the errors below with clang toolchain (LLVM=1):

drivers/media/i2c/ov5640.c:3124:3: error: expected expression
                 unsigned int max = mode->crop.height + ctrl->val - 
OV5640_MIN_VBLANK;
                 ^
drivers/media/i2c/ov5640.c:3128:7: error: use of undeclared identifier 'max'
                                          max, 
sensor->ctrls.exposure->step, max);
                                          ^
drivers/media/i2c/ov5640.c:3128:42: error: use of undeclared identifier 
'max'
                                          max, 
sensor->ctrls.exposure->step, max);
 
      ^
3 errors generated.
make[3]: *** [scripts/Makefile.build:288: drivers/media/i2c/ov5640.o] 
Error 1

Declaring the  variable within a compound statement following the label 
(case), or moving the declaration after the switch fix the build.
The former construct might be more aligned with kernel coding use (?).

switch(...) {
case ...: {
	unsigned int max = ...;
	...	
}
}

or

switch(...) {
	unsigned int max = 0;
	case ...:
		...
		break;
}

> +
>   	/*
>   	 * If the device is not powered up by the host driver do
>   	 * not apply any controls to H/W at this time. Instead
> @@ -3031,6 +3072,9 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
>   	case V4L2_CID_VFLIP:
>   		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
>   		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov5640_set_ctrl_vblank(sensor, ctrl->val);
> +		break;
>   	default:
>   		ret = -EINVAL;
>   		break;
> @@ -3050,6 +3094,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>   	const struct v4l2_ctrl_ops *ops = &ov5640_ctrl_ops;
>   	struct ov5640_ctrls *ctrls = &sensor->ctrls;
>   	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> +	unsigned int max_vblank;
>   	unsigned int hblank;
>   	int ret;
>   
> @@ -3073,6 +3118,11 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>   	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, hblank,
>   					  hblank, 1, hblank);
>   
> +	max_vblank = OV5640_MAX_VTS - mode->crop.height;
> +	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
> +					  OV5640_MIN_VBLANK, max_vblank,
> +					  1, mode->vblank_def);
> +
>   	/* Auto/manual white balance */
>   	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>   					   V4L2_CID_AUTO_WHITE_BALANCE,
Regards,
  Xavier

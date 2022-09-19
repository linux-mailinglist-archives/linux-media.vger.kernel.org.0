Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07C9B5BCA97
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 13:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiISLVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 07:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiISLVf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 07:21:35 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793241ADA9
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 04:21:33 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7B2F210005D; Mon, 19 Sep 2022 12:21:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
        t=1663586491; bh=O254l/72pOsjogOMXZXZUxkhxDl5U4UO80ZUKtPBawU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n0XM3Waw76low13z0SKo9PJGDHww5huFjsz7KH40TK7rwBvZZ5ciNdevh4PLAyhQf
         FaD/BwFqW82p5jjQCndC2cOKz9uZ5GSsFa45oKrBrnrkJgKOBl6XU3Xmx7kOnsX7z+
         tOyaP5xlluJ+T5VpbnOapcQB3c4We986uI3VFcr4TDgD2MGkTtpIGkECGmtKXRibgB
         7U//dqnNSx90eXX5mBQamRbSfGj/Jnc341sjBvy3ZhyXwfOEuapayEmEwMAc/pRwYn
         nM0CGDsHZp7TYatwL67yseMT2HGhBUAcXzbOx6fIMiLc+VA1rGAZTG+b9yF5cUxq3G
         IWNXct0ZMp7iA==
Date:   Mon, 19 Sep 2022 12:21:31 +0100
From:   Sean Young <sean@mess.org>
To:     Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v2] media: cx88: add IR remote support for NotOnlyTV LV3H
Message-ID: <YyhQu5UMoF/BDJCv@gofer.mess.org>
References: <4386345.LvFx2qVVIh@tool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4386345.LvFx2qVVIh@tool>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

Sorry about the long delay for reviewing this. I missed this patch, sorry.

On Mon, Feb 07, 2022 at 03:51:41PM +0100, Daniel González Cabanelas wrote:
> The PCI hybrid card NotOnlyTV LV3H has a built-in IR receiver connected
> via I2C bus, currently not supported. This receiver is probably present
> in more Geniatech cards. It has no capability for repeating when a key is
> held down.
> 
> Add support for this built-in IR receiver. Use the existing Total Media
> In Hand_02 remote keytable (Geniatech Mygica X8507) which matches exactly
> the LV3H remote.
> 
> Signed-off-by: Daniel González Cabanelas <dgcbueu@gmail.com>
> Signed-off-by: Marek Kidawski <mark_kiddy@wp.pl>
> ---
> changes in v2:
>  - Save a bitwise operation when no key is pressed
>  - Simplify the code
> 
>  drivers/media/i2c/ir-kbd-i2c.c      | 47 +++++++++++++++++++++++++++++
>  drivers/media/pci/cx88/cx88-input.c |  2 +-
>  drivers/media/pci/cx88/cx88-video.c |  1 +
>  include/media/i2c/ir-kbd-i2c.h      |  1 +
>  4 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
> index 566741735..145abfd13 100644
> --- a/drivers/media/i2c/ir-kbd-i2c.c
> +++ b/drivers/media/i2c/ir-kbd-i2c.c
> @@ -238,6 +238,43 @@ static int get_key_knc1(struct IR_i2c *ir, enum rc_proto *protocol,
>  	return 1;
>  }
>  
> +static int get_key_geniatech(struct IR_i2c *ir, enum rc_proto *protocol,
> +			     u32 *scancode, u8 *toggle)
> +{
> +	int i, rc;
> +	unsigned char b;
> +
> +	/* poll IR chip */
> +	for (i = 0; i < 4; i++) {
> +		rc = i2c_master_recv(ir->c, &b, 1);
> +		if (rc == 1)
> +			break;
> +		msleep(1);

checkpatch.pl rightfully points out the following:

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst

msleep(1) will sleep for at least 20ms. I think this is what you want here;
mdelay(1) might introduce busy-cycles every second, surely we do not what to
that.

Is the sleep needed at all?

Thanks

Sean


> +	}
> +	if (rc != 1) {
> +		dev_dbg(&ir->rc->dev, "read error\n");
> +		if (rc < 0)
> +			return rc;
> +		return -EIO;
> +	}
> +
> +	/* don't repeat the key */
> +	if (ir->old == b)
> +		return 0;
> +	ir->old = b;
> +
> +	/* decode to RC5 */
> +	b &= 0x7f;
> +	b = (b - 1) / 2;
> +
> +	dev_dbg(&ir->rc->dev, "key %02x\n", b);
> +
> +	*protocol = RC_PROTO_RC5;
> +	*scancode = b;
> +	*toggle = ir->old >> 7;
> +	return 1;
> +}
> +
>  static int get_key_avermedia_cardbus(struct IR_i2c *ir, enum rc_proto *protocol,
>  				     u32 *scancode, u8 *toggle)
>  {
> @@ -766,6 +803,13 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		rc_proto    = RC_PROTO_BIT_OTHER;
>  		ir_codes    = RC_MAP_EMPTY;
>  		break;
> +	case 0x33:
> +		name        = "Geniatech";
> +		ir->get_key = get_key_geniatech;
> +		rc_proto    = RC_PROTO_BIT_RC5;
> +		ir_codes    = RC_MAP_TOTAL_MEDIA_IN_HAND_02;
> +		ir->old     = 0xfc;
> +		break;
>  	case 0x6b:
>  		name        = "FusionHDTV";
>  		ir->get_key = get_key_fusionhdtv;
> @@ -825,6 +869,9 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		case IR_KBD_GET_KEY_KNC1:
>  			ir->get_key = get_key_knc1;
>  			break;
> +		case IR_KBD_GET_KEY_GENIATECH:
> +			ir->get_key = get_key_geniatech;
> +			break;
>  		case IR_KBD_GET_KEY_FUSIONHDTV:
>  			ir->get_key = get_key_fusionhdtv;
>  			break;
> diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
> index ce0ef0b81..a04a1d33f 100644
> --- a/drivers/media/pci/cx88/cx88-input.c
> +++ b/drivers/media/pci/cx88/cx88-input.c
> @@ -586,7 +586,7 @@ void cx88_i2c_init_ir(struct cx88_core *core)
>  {
>  	struct i2c_board_info info;
>  	static const unsigned short default_addr_list[] = {
> -		0x18, 0x6b, 0x71,
> +		0x18, 0x33, 0x6b, 0x71,
>  		I2C_CLIENT_END
>  	};
>  	static const unsigned short pvr2000_addr_list[] = {
> diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
> index c17ad9f7d..4d78acf66 100644
> --- a/drivers/media/pci/cx88/cx88-video.c
> +++ b/drivers/media/pci/cx88/cx88-video.c
> @@ -1388,6 +1388,7 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
>  	}
>  		fallthrough;
>  	case CX88_BOARD_DVICO_FUSIONHDTV_5_PCI_NANO:
> +	case CX88_BOARD_NOTONLYTV_LV3H:
>  		request_module("ir-kbd-i2c");
>  	}
>  
> diff --git a/include/media/i2c/ir-kbd-i2c.h b/include/media/i2c/ir-kbd-i2c.h
> index 9f47d6a48..0b58f8b9e 100644
> --- a/include/media/i2c/ir-kbd-i2c.h
> +++ b/include/media/i2c/ir-kbd-i2c.h
> @@ -35,6 +35,7 @@ enum ir_kbd_get_key_fn {
>  	IR_KBD_GET_KEY_PIXELVIEW,
>  	IR_KBD_GET_KEY_HAUP,
>  	IR_KBD_GET_KEY_KNC1,
> +	IR_KBD_GET_KEY_GENIATECH,
>  	IR_KBD_GET_KEY_FUSIONHDTV,
>  	IR_KBD_GET_KEY_HAUP_XVR,
>  	IR_KBD_GET_KEY_AVERMEDIA_CARDBUS,
> -- 
> 2.35.1
> 
> 
> 

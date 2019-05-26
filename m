Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11BED2A930
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2019 11:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfEZJeD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 May 2019 05:34:03 -0400
Received: from gofer.mess.org ([88.97.38.141]:35407 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbfEZJeC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 May 2019 05:34:02 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0CBE1603DB; Sun, 26 May 2019 10:33:59 +0100 (BST)
Date:   Sun, 26 May 2019 10:33:57 +0100
From:   Sean Young <sean@mess.org>
To:     Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org
Subject: Re: [PATCH] drivers/media/dvb-frontends: Implement probe/remove for
 stv6110x
Message-ID: <20190526093355.ednxp725ui6lwoji@gofer.mess.org>
References: <20190509195118.23027-1-tobias.johannes.klausmann@mni.thm.de>
 <ba914388-04d1-8a57-77eb-3f303941b9bf@mni.thm.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba914388-04d1-8a57-77eb-3f303941b9bf@mni.thm.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tobias,

On Sun, May 12, 2019 at 04:53:06PM +0200, Tobias Klausmann wrote:
> Ping,
> 
> comments for this patch are appreciated!

Sorry for not back to you earlier. 

Please run script/checkpatch.pl --strict on your patch. There are several
cosmetic changes needed.
> 
> Thanks,
> 
> Tobias
> 
> 
> On 09.05.19 21:51, Tobias Klausmann wrote:
> > Refactor out the common parts of stv6110x_probe() and stv6110x_attach() into
> > separate functions.
> > 
> > This provides the needed functionality to use dvb_module_probe() instead of
> > dvb_attach()!

The lines shouldn't be longer than 75 characters.

This is a great improvement. It would be nice to see an actual driver use
dvb_module_probe() rather than dvb_attach(), so that the new code paths
are used. Do you have hardware to test this?

> > 
> > Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
> > ---
> >   drivers/media/dvb-frontends/stv6110x.c      | 125 ++++++++++++++++----
> >   drivers/media/dvb-frontends/stv6110x.h      |   3 +
> >   drivers/media/dvb-frontends/stv6110x_priv.h |   3 +-
> >   3 files changed, 109 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-frontends/stv6110x.c
> > index 82c002d3833a..17bc7adf3771 100644
> > --- a/drivers/media/dvb-frontends/stv6110x.c
> > +++ b/drivers/media/dvb-frontends/stv6110x.c
> > @@ -345,6 +345,33 @@ static void stv6110x_release(struct dvb_frontend *fe)
> >   	kfree(stv6110x);
> >   }
> > +void st6110x_init_regs(struct stv6110x_state *stv6110x)
> > +{
> > +	u8 default_regs[] = {0x07, 0x11, 0xdc, 0x85, 0x17, 0x01, 0xe6, 0x1e};
> > +
> > +	memcpy(stv6110x->regs, default_regs, 8);
> > +}
> > +
> > +void stv6110x_setup_divider(struct stv6110x_state *stv6110x)
> > +{
> > +	switch (stv6110x->config->clk_div) {
> > +	default:
> > +	case 1:
> > +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 0);
> > +		break;
> > +	case 2:
> > +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 1);
> > +		break;
> > +	case 4:
> > +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 2);
> > +		break;
> > +	case 8:
> > +	case 0:
> > +		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 3);
> > +		break;
> > +	}
> > +}
> > +
> >   static const struct dvb_tuner_ops stv6110x_ops = {
> >   	.info = {
> >   		.name		  = "STV6110(A) Silicon Tuner",
> > @@ -354,7 +381,7 @@ static const struct dvb_tuner_ops stv6110x_ops = {
> >   	.release		= stv6110x_release
> >   };
> > -static const struct stv6110x_devctl stv6110x_ctl = {
> > +static struct stv6110x_devctl stv6110x_ctl = {
> >   	.tuner_init		= stv6110x_init,
> >   	.tuner_sleep		= stv6110x_sleep,
> >   	.tuner_set_mode		= stv6110x_set_mode,
> > @@ -368,39 +395,77 @@ static const struct stv6110x_devctl stv6110x_ctl = {
> >   	.tuner_get_status	= stv6110x_get_status,
> >   };
> > +void stv6110x_set_frontend_opts(struct stv6110x_state *stv6110x)
> > +{
> > +	stv6110x->frontend->tuner_priv		= stv6110x;
> > +	stv6110x->frontend->ops.tuner_ops	= stv6110x_ops;
> > +}
> > +
> > +static struct stv6110x_devctl *stv6110x_get_devctl(struct i2c_client *client)
> > +{
> > +	struct stv6110x_state *stv6110x = i2c_get_clientdata(client);
> > +
> > +	dev_dbg(&client->dev, "\n");
> > +
> > +	return stv6110x->devctl;
> > +}
> > +
> > +static int stv6110x_probe(struct i2c_client *client,
> > +			const struct i2c_device_id *id)
> > +{
> > +	struct stv6110x_config *config = client->dev.platform_data;
> > +
> > +	struct stv6110x_state *stv6110x;
> > +
> > +	stv6110x = kzalloc(sizeof(struct stv6110x_state), GFP_KERNEL);

This should be:
	stv6110x = kzalloc(sizeof(*stv6110x), GFP_KERNEL);

> > +	if (!stv6110x)
> > +		return -ENOMEM;
> > +
> > +	stv6110x->frontend	= config->frontend;
> > +	stv6110x->i2c		= client->adapter;
> > +	stv6110x->config	= config;
> > +	stv6110x->devctl	= &stv6110x_ctl;
> > +
> > +	st6110x_init_regs(stv6110x);
> > +	stv6110x_setup_divider(stv6110x);
> > +	stv6110x_set_frontend_opts(stv6110x);
> > +
> > +	printk(KERN_INFO "%s: Probed STV6110x\n", __func__);

Please use dev_info().

> > +
> > +	i2c_set_clientdata(client, stv6110x);
> > +
> > +	/* setup callbacks */
> > +	config->get_devctl = stv6110x_get_devctl;
> > +
> > +	return 0;
> > +}
> > +
> > +static int stv6110x_remove(struct i2c_client *client)
> > +{
> > +	struct stv6110x_state *stv6110x = i2c_get_clientdata(client);
> > +
> > +	stv6110x_release(stv6110x->frontend);
> > +	return 0;
> > +}
> > +
> >   const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
> >   					const struct stv6110x_config *config,
> >   					struct i2c_adapter *i2c)
> >   {
> >   	struct stv6110x_state *stv6110x;
> > -	u8 default_regs[] = {0x07, 0x11, 0xdc, 0x85, 0x17, 0x01, 0xe6, 0x1e};
> > -	stv6110x = kzalloc(sizeof (struct stv6110x_state), GFP_KERNEL);
> > +	stv6110x = kzalloc(sizeof(struct stv6110x_state), GFP_KERNEL);

	stv6110x = kzalloc(sizeof(*stv6110x), GFP_KERNEL);

Maybe we can patch up the dvb_attach() call sites and do away with
stv6110x_attach completely. Do you have dvb hardware with this frontend
to test?


> >   	if (!stv6110x)
> >   		return NULL;
> > +	stv6110x->frontend	= fe;
> >   	stv6110x->i2c		= i2c;
> >   	stv6110x->config	= config;
> >   	stv6110x->devctl	= &stv6110x_ctl;
> > -	memcpy(stv6110x->regs, default_regs, 8);
> > -	/* setup divider */
> > -	switch (stv6110x->config->clk_div) {
> > -	default:
> > -	case 1:
> > -		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 0);
> > -		break;
> > -	case 2:
> > -		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 1);
> > -		break;
> > -	case 4:
> > -		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 2);
> > -		break;
> > -	case 8:
> > -	case 0:
> > -		STV6110x_SETFIELD(stv6110x->regs[STV6110x_CTRL2], CTRL2_CO_DIV, 3);
> > -		break;
> > -	}
> > +	st6110x_init_regs(stv6110x);
> > +	stv6110x_setup_divider(stv6110x);
> > +	stv6110x_set_frontend_opts(stv6110x);
> >   	fe->tuner_priv		= stv6110x;
> >   	fe->ops.tuner_ops	= stv6110x_ops;
> > @@ -410,6 +475,24 @@ const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
> >   }
> >   EXPORT_SYMBOL(stv6110x_attach);
> > +static const struct i2c_device_id stv6110x_id_table[] = {
> > +	{"stv6110x", 0},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, stv6110x_id_table);
> > +
> > +static struct i2c_driver stv6110x_driver = {
> > +	.driver = {
> > +		.name	= "stv6110x",
> > +		.suppress_bind_attrs = true,
> > +	},
> > +	.probe		= stv6110x_probe,
> > +	.remove		= stv6110x_remove,
> > +	.id_table	= stv6110x_id_table,
> > +};
> > +
> > +module_i2c_driver(stv6110x_driver);
> > +
> >   MODULE_AUTHOR("Manu Abraham");
> >   MODULE_DESCRIPTION("STV6110x Silicon tuner");
> >   MODULE_LICENSE("GPL");
> > diff --git a/drivers/media/dvb-frontends/stv6110x.h b/drivers/media/dvb-frontends/stv6110x.h
> > index 696b6e5b9e7b..7714adea5242 100644
> > --- a/drivers/media/dvb-frontends/stv6110x.h
> > +++ b/drivers/media/dvb-frontends/stv6110x.h
> > @@ -27,6 +27,9 @@ struct stv6110x_config {
> >   	u8	addr;
> >   	u32	refclk;
> >   	u8	clk_div; /* divisor value for the output clock */
> > +	struct dvb_frontend		*frontend;
> > +
> > +	struct stv6110x_devctl* (*get_devctl)(struct i2c_client *);

The i2c_client needs an argument name.

> >   };
> >   enum tuner_mode {
> > diff --git a/drivers/media/dvb-frontends/stv6110x_priv.h b/drivers/media/dvb-frontends/stv6110x_priv.h
> > index 109dfaf4ba42..383549d25268 100644
> > --- a/drivers/media/dvb-frontends/stv6110x_priv.h
> > +++ b/drivers/media/dvb-frontends/stv6110x_priv.h
> > @@ -66,11 +66,12 @@
> >   #define REFCLOCK_MHz				(stv6110x->config->refclk / 1000000)
> >   struct stv6110x_state {
> > +	struct dvb_frontend		*frontend;
> >   	struct i2c_adapter		*i2c;
> >   	const struct stv6110x_config	*config;
> >   	u8				regs[8];
> > -	const struct stv6110x_devctl	*devctl;
> > +	struct stv6110x_devctl	*devctl;
> >   };
> >   #endif /* __STV6110x_PRIV_H */


Thanks,

Sean

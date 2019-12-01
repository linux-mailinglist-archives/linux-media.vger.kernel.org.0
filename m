Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D255910E100
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 08:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfLAH4K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 02:56:10 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:48830 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbfLAH4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 02:56:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=FCu+GZh/MV35W7L3MvP8XVnpQ9u3c3lBDXh/NgS/ZZ4=; b=UFVSeqs0QVBd6/YDWWgFvrIhW
        etzfcOGzRcrKE4aWsoIP0T/568k2N9SnEcWrK6YjA3h0vcMqI2OH4km++sublrGJllXYxybJ7OKT3
        9aZXrwmc7Z9NcfcpgwSBEHUHjH02eYd756h6g6we7eb4GlMNB8Ygznleqk+vdTRiAIJ2IjJ90s8PW
        3UsNEx5+07t/C5ttpHN4zPMcd9FAy0myxp60SW6TyRPdhuJDEBX06iIAOEEORBUbmpavg411hN8aP
        1IrCOgMp4g71p3Y5JT8V1++OemNpuGstXLuaGtLXoqUxgAJEiMbZ1Otxz21EGxq29BxbkgnF7o5o0
        TnIL7FkEw==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ibK5O-0004nk-8Z; Sun, 01 Dec 2019 07:56:06 +0000
Date:   Sun, 1 Dec 2019 08:56:02 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     gregkh@linuxfoundation.org, rfontana@redhat.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dummy_dvb_fe: register adapter/frontend
Message-ID: <20191201085602.7212436b@kernel.org>
In-Reply-To: <20191126153157.26355-1-dwlsalmeida@gmail.com>
References: <20191126153157.26355-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 26 Nov 2019 12:31:57 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Before using the DTV frontend core, a bridge driver should register the
> new frontend at the subsystem and unregister it at device detach / removal.

This patch is conceptually wrong. The dummy_dvb_fe is a frontend driver.

As such, it doesn't register itself as a bridge. What we need here is a
separate virtual DVB bridge driver with would register itself as a DVB
adapter and use the dummy_dvb_fe as its frontend.

Regards,
Mauro

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 39 ++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 4db679cb70ad..1ccb58c67e8e 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -13,12 +13,12 @@
>  #include <media/dvb_frontend.h>
>  #include "dvb_dummy_fe.h"
>  
> +DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>  
>  struct dvb_dummy_fe_state {
>  	struct dvb_frontend frontend;
>  };
>  
> -
>  static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
>  				    enum fe_status *status)
>  {
> @@ -84,7 +84,36 @@ static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
>  
>  static int dvb_dummy_fe_init(struct dvb_frontend* fe)
>  {
> -	return 0;
> +	int result = 0;
> +	struct dvb_adapter *adapter = fe->dvb;
> +
> +	result = dvb_register_adapter(adapter,
> +				      KBUILD_MODNAME,
> +				      THIS_MODULE,
> +				      adapter->device,
> +				      adapter_nr);
> +
> +	if (!result) {
> +		pr_err("DVB_DUMMY_FE: Failed to register the adapter, errno:%d",
> +			result);
> +		goto err;
> +	}
> +
> +	result = dvb_register_frontend(adapter, fe);
> +	if (!result) {
> +		pr_err("DVB_DUMMY_FE: Failed to register the frontend, errno:%d",
> +			result);
> +		goto err;
> +	}
> +
> +	return result;
> +
> +err:
> +	dvb_unregister_adapter(adapter);
> +	dvb_unregister_frontend(fe);
> +	dvb_frontend_detach(fe);
> +	return result;
> +
>  }
>  
>  static int dvb_dummy_fe_set_tone(struct dvb_frontend *fe,
> @@ -102,6 +131,12 @@ static int dvb_dummy_fe_set_voltage(struct dvb_frontend *fe,
>  static void dvb_dummy_fe_release(struct dvb_frontend* fe)
>  {
>  	struct dvb_dummy_fe_state* state = fe->demodulator_priv;
> +	struct dvb_adapter *adapter = fe->dvb;
> +
> +	dvb_unregister_adapter(adapter);
> +	dvb_unregister_frontend(fe);
> +	dvb_frontend_detach(fe);
> +
>  	kfree(state);
>  }
>  



Cheers,
Mauro

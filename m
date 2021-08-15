Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C023EC83B
	for <lists+linux-media@lfdr.de>; Sun, 15 Aug 2021 11:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236425AbhHOJGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 05:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhHOJGv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 05:06:51 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A8EC061764;
        Sun, 15 Aug 2021 02:06:21 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f2so758739ljn.1;
        Sun, 15 Aug 2021 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pzy7Bev12LeveIcKIogt+C21+5RUV0MqC2YzBhF4exY=;
        b=P6uYhMO1bx8QQX88OIpGMqBjx3sclXp9YfunKOLr7Wq0Zy/+oGRbl7MKt88sDkVz3x
         Ep5x6laeTNHjCOjrs2TF26dtord2U1RoU6SQ421d5jAgayclnVcUITdcjOBK40qLijv0
         Q3TZrT2DIoOqip06slEnPwnRXacg1EGgt+OQKbmiy8Az3sZsD5zCa2dSAyKu9GIn6JqM
         8z2iA9cw7JqNda6/qsEqj7JHo62R381nn+BllWvNeP7wefsI+vYV8bb2zIQSYuRt/CAv
         ZDW5XwFYGsmL8KBJywEdTMBSVkGNBO95NJCIwI42qRxrISZaGJqRuN8ZEmxlALQaKbks
         FL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pzy7Bev12LeveIcKIogt+C21+5RUV0MqC2YzBhF4exY=;
        b=MmI+SaUBtsAC5XUllrWlc/tKLcjuS/97FGI1dWE5+h+d7AU998fdV+wFf0OhGqelNG
         9SOVeCzqULRbwB8q27CKfqd5nUo4DYEsWKnLm+RQ5t5PUPMYSBrweoHalEYiaX2Idgeu
         1Fc5nD1aUBjKzxe2h+04vIk14oSAQBeLEMP+2XLhDUaBg98np9EZNW/mgDB1esDPvtja
         k0hvSMV7ei1OFs6ozMtOjXsY4LxF1STANcp1n33S9Zp8O+a47jjB0eM4bzi0CWisuLLe
         gnHXjBXezd/HywxMOpJCFM/62KfW0+aamgxEj9GH1RWpUf7LHl+Hne53tofYbnH4mqfP
         JNng==
X-Gm-Message-State: AOAM53101eyOex8IaK9yf+mzE6KLxSBi8iNhpEFzy50HhfqCnJSRwT66
        rosVOsv6dETtAtt+SEiJ/ps=
X-Google-Smtp-Source: ABdhPJz4q+pGxo8Hyt9MoQbcofal8aZiHOdu8bTwFQu/BZNlEg3A5gqqatzoYdGKUmgR4U2u/8nBGA==
X-Received: by 2002:a05:651c:481:: with SMTP id s1mr7931307ljc.446.1629018379345;
        Sun, 15 Aug 2021 02:06:19 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.79])
        by smtp.gmail.com with ESMTPSA id c12sm624462lfh.248.2021.08.15.02.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Aug 2021 02:06:19 -0700 (PDT)
Subject: Re: [PATCH] media: mxl111sf: change mutex_init() location
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Sean Young <sean@mess.org>
Cc:     mkrufky@linuxtv.org, mchehab@kernel.org, crope@iki.fi,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+5ca0bf339f13c4243001@syzkaller.appspotmail.com
References: <20210730213829.2909-1-paskripkin@gmail.com>
 <20210815083755.GA1827@gofer.mess.org>
 <7ee99788-d9a5-0a38-ed02-51d9b42ebc11@gmail.com>
Message-ID: <80648833-5f5a-0811-a281-0dba87938d3c@gmail.com>
Date:   Sun, 15 Aug 2021 12:06:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7ee99788-d9a5-0a38-ed02-51d9b42ebc11@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/15/21 11:49 AM, Pavel Skripkin wrote:
> On 8/15/21 11:37 AM, Sean Young wrote:
>> On Sat, Jul 31, 2021 at 12:38:29AM +0300, Pavel Skripkin wrote:
>>> Syzbot reported, that mxl111sf_ctrl_msg() uses uninitialized
>>> mutex. The problem was in wrong mutex_init() location.
>>> 
>>> Previous mutex_init(&state->msg_lock) call was in ->init() function, but
>>> dvb_usbv2_init() has this order of calls:
>>> 
>>> 	dvb_usbv2_init()
>>> 	  dvb_usbv2_adapter_init()
>>> 	    dvb_usbv2_adapter_frontend_init()
>>> 	      props->frontend_attach()
>>> 
>>> 	  props->init()
>>> 
>>> Since mxl111sf_frontend_attach_atsc_mh() calls mxl111sf_ctrl_msg()
>>> internally we need to initialize state->msg_lock in it to make lockdep
>>> happy.
>> 
>> What about the other frontends like mxl111sf_frontend_attach_dvbt? They
>> no longer initialize the mutex.
>> 
> Good point. I see, that all other frontends also call
> mxl111sf_ctrl_msg() inside ->frontend_attach() call.
> 
> I think, that fixing dvb-usb core is not good idea, so, I will add
> mutex_init() call inside all frontends, which use mxl111sf_init().
> 
> What do you think about it?
> 
> 


Something like this should work. Helper is just to not copy-paste code 
parts. Build tested against v5.14-rc5


diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c 
b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 7865fa0a8295..db1ad3815cd5 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -49,6 +49,13 @@ MODULE_PARM_DESC(rfswitch, "force rf switch position 
(0=auto, 1=ext, 2=int).");

  DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);

+static inline void mxl111sf_init_msg_mutex(struct dvb_usb_adapter *adap)
+{
+	struct mxl111sf_state *state = d_to_priv(adap_to_d(adap));
+
+	mutex_init(&state->msg_lock);
+}
+
  int mxl111sf_ctrl_msg(struct mxl111sf_state *state,
  		      u8 cmd, u8 *wbuf, int wlen, u8 *rbuf, int rlen)
  {
@@ -931,8 +938,6 @@ static int mxl111sf_init(struct dvb_usb_device *d)
  		  .len = sizeof(eeprom), .buf = eeprom },
  	};

-	mutex_init(&state->msg_lock);
-
  	ret = get_chip_info(state);
  	if (mxl_fail(ret))
  		pr_err("failed to get chip info during probe");
@@ -963,16 +968,19 @@ static int mxl111sf_init(struct dvb_usb_device *d)

  static int mxl111sf_frontend_attach_dvbt(struct dvb_usb_adapter *adap)
  {
+	mxl111sf_init_msg_mutex(adap);
  	return mxl111sf_attach_demod(adap, 0);
  }

  static int mxl111sf_frontend_attach_atsc(struct dvb_usb_adapter *adap)
  {
+	mxl111sf_init_msg_mutex(adap);
  	return mxl111sf_lgdt3305_frontend_attach(adap, 0);
  }

  static int mxl111sf_frontend_attach_mh(struct dvb_usb_adapter *adap)
  {
+	mxl111sf_init_msg_mutex(adap);
  	return mxl111sf_lg2160_frontend_attach(adap, 0);
  }

@@ -981,6 +989,7 @@ static int mxl111sf_frontend_attach_atsc_mh(struct 
dvb_usb_adapter *adap)
  	int ret;
  	pr_debug("%s\n", __func__);

+	mxl111sf_init_msg_mutex(adap);
  	ret = mxl111sf_lgdt3305_frontend_attach(adap, 0);
  	if (ret < 0)
  		return ret;
@@ -1001,6 +1010,7 @@ static int mxl111sf_frontend_attach_mercury(struct 
dvb_usb_adapter *adap)
  	int ret;
  	pr_debug("%s\n", __func__);

+	mxl111sf_init_msg_mutex(adap);
  	ret = mxl111sf_lgdt3305_frontend_attach(adap, 0);
  	if (ret < 0)
  		return ret;
@@ -1021,6 +1031,7 @@ static int 
mxl111sf_frontend_attach_mercury_mh(struct dvb_usb_adapter *adap)
  	int ret;
  	pr_debug("%s\n", __func__);

+	mxl111sf_init_msg_mutex(adap);
  	ret = mxl111sf_attach_demod(adap, 0);
  	if (ret < 0)
  		return ret;



With regards,
Pavel Skripkin

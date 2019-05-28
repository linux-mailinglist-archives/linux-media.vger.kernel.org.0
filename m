Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39AF02D0AE
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 22:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfE1UtO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 16:49:14 -0400
Received: from casper.infradead.org ([85.118.1.10]:45802 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfE1UtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 16:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=d6cEPCsonTLodViiolHgyHpMa7BW8rNmOFRk6MH49VY=; b=bWWKz7yoouzWpTwbEeEjYiln3c
        uxpN+zosc8YxVL0Qjz5jOOghe0SBbI8UGcQX746XLxxG5y2I8FVEeii8p08XrAkZjVVZZidP20h4/
        fuOmKM44lxzeg8WF2XWov6/k92rEF1nBbyJVXEvDWAln4+LUgYZIFTZuURTkb5VDl7F6Ssl1y51Pv
        LY9HIA/y59MAyVakxMzwX2+kLZYZFkQW1a937sjKxk5e+7Yync1tL442buELDnPy8tPT9A5kpriCx
        TMxeNr4x2Pqc3+2TyvPexcNeJlOCFtHlzpRgIqsdaXKm9/CKRG4/KghNrRyd2tkMzylI7ia6Tin4S
        11ElVKKQ==;
Received: from [187.58.202.19] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVj1y-0004jn-Ca; Tue, 28 May 2019 20:49:10 +0000
Date:   Tue, 28 May 2019 17:49:06 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Michael Ira Krufky <mkrufky@linuxtv.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: [PATCH] media: cxusb-analog: Fix some coding style issues
Message-ID: <20190528174906.6a4a26ad@coco.lan>
In-Reply-To: <CAOcJUbx_tqXxF9+EPZa+cJSSQ3w52M2oC0dMxZM0uDh7Stm1yA@mail.gmail.com>
References: <25f2f4e4f07cc56ce58ddf964cd4b3cb94c33d21.1559074371.git.mchehab+samsung@kernel.org>
        <CAOcJUbx_tqXxF9+EPZa+cJSSQ3w52M2oC0dMxZM0uDh7Stm1yA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

Em Tue, 28 May 2019 16:18:24 -0400
Michael Ira Krufky <mkrufky@linuxtv.org> escreveu:

> Hey, so the analog support is merged?  Great news!

Yes!

> 
> I believe that you may have missed curly brackets, `{` , `}` in the
> following hunks:
> 
> 
> @@ -763,7 +764,7 @@ static int cxusb_medion_v_ss_auxbuf_alloc(struct
> cxusb_medion_dev *cxdev,
>         auxbuflen = framelen + urblen;
> 
>         buf = vmalloc(auxbuflen);
> -       if (buf == NULL)
> +       if (!buf)
>                 return -ENOMEM;
> 
>         cxusb_auxbuf_init(dvbdev, &cxdev->auxbuf, buf, auxbuflen);
> 
> ...
> 
> @@ -977,7 +978,7 @@ static void cxusb_medion_v_stop_streaming(struct
> vb2_queue *q)
>         mutex_unlock(cxdev->videodev->lock);
> 
>         for (i = 0; i < CXUSB_VIDEO_URBS; i++)
> -               if (cxdev->streamurbs[i] != NULL)
> +               if (cxdev->streamurbs[i])
>                         usb_kill_urb(cxdev->streamurbs[i]);
> 
>         flush_work(&cxdev->urbwork);
> @@ -1626,7 +1627,7 @@ int cxusb_medion_analog_init(struct
> dvb_usb_device *dvbdev)
>                                cxusub_medion_pin_config);
>         if (ret != 0)
>                 dev_warn(&dvbdev->udev->dev,
> -                       "cx25840 pin config failed (%d)\n", ret);
> +                        "cx25840 pin config failed (%d)\n", ret);
> 
>         /* make sure that we aren't in radio mode */
>         v4l2_subdev_call(cxdev->tda9887, video, s_std, cxdev->norm);


No, the coding style we use is actually:

1) if there's just one statement, don't use brackets, e. g.

	if (foo)
		bar;
	

   or

	if (foo)
		bar;
	else
		foobar;

2) if there are more than one (either at if or else) use brackets in
a balanced way on both, e. g. "if (...) {} else {}"


> 
> 
> 
> Cheers,
> 
> Mike Krufky
> 
> On Tue, May 28, 2019 at 4:13 PM Mauro Carvalho Chehab
> <mchehab+samsung@kernel.org> wrote:
> >
> > This is a new file, so the best moment to make it to follow
> > Kernel coding style is now.
> >
> > This patch was partially generated with:
> >
> >         ./scripts/checkpatch.pl --fix-inplace --strict -f drivers/media/usb/dvb-usb/cxusb-analog.c
> >
> > And manually checked and adjusted to avoid any warnings.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >  drivers/media/usb/dvb-usb/cxusb-analog.c | 67 ++++++++++++------------
> >  1 file changed, 34 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
> > index 68e0973caed5..9b42ca71c177 100644
> > --- a/drivers/media/usb/dvb-usb/cxusb-analog.c
> > +++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
> > @@ -204,7 +204,7 @@ static bool cxusb_medion_cf_refc_fld_chg(struct dvb_usb_device *dvbdev,
> >                               "field %c after line %u field change\n",
> >                               firstfield ? '1' : '2', bt656->line);
> >
> > -               if (bt656->buf != NULL && remsamples > 0) {
> > +               if (bt656->buf && remsamples > 0) {
> >                         memset(bt656->buf, 0, remsamples);
> >                         bt656->buf += remsamples;
> >
> > @@ -219,7 +219,7 @@ static bool cxusb_medion_cf_refc_fld_chg(struct dvb_usb_device *dvbdev,
> >         }
> >
> >         remlines = maxlines - bt656->line;
> > -       if (bt656->buf != NULL && remlines > 0) {
> > +       if (bt656->buf && remlines > 0) {
> >                 memset(bt656->buf, 0, remlines * maxlinesamples);
> >                 bt656->buf += remlines * maxlinesamples;
> >
> > @@ -277,7 +277,7 @@ static void cxusb_medion_cf_refc_line_smpl(struct dvb_usb_device *dvbdev,
> >                               bt656->line, bt656->pos);
> >
> >         remsamples = maxlinesamples - bt656->linesamples;
> > -       if (bt656->buf != NULL && remsamples > 0) {
> > +       if (bt656->buf && remsamples > 0) {
> >                 memset(bt656->buf, 0, remsamples);
> >                 bt656->buf += remsamples;
> >
> > @@ -313,9 +313,9 @@ static bool cxusb_medion_cf_ref_code(struct dvb_usb_device *dvbdev,
> >                                      unsigned int maxlinesamples,
> >                                      unsigned char buf[4])
> >  {
> > -       if (bt656->fmode == START_SEARCH)
> > +       if (bt656->fmode == START_SEARCH) {
> >                 cxusb_medion_cf_refc_start_sch(dvbdev, bt656, firstfield, buf);
> > -       else if (bt656->fmode == LINE_SAMPLES) {
> > +       } else if (bt656->fmode == LINE_SAMPLES) {
> >                 cxusb_medion_cf_refc_line_smpl(dvbdev, bt656, firstfield,
> >                                                maxlinesamples, buf);
> >                 return false;
> > @@ -359,7 +359,7 @@ static void cxusb_medion_cs_line_smpl(struct cxusb_bt656_params *bt656,
> >                                       unsigned int maxlinesamples,
> >                                       unsigned char val)
> >  {
> > -       if (bt656->buf != NULL)
> > +       if (bt656->buf)
> >                 *(bt656->buf++) = val;
> >
> >         bt656->linesamples++;
> > @@ -505,8 +505,9 @@ static bool cxusb_medion_v_process_auxbuf(struct cxusb_medion_dev *cxdev,
> >                                                  struct cxusb_medion_vbuffer,
> >                                                  list);
> >                         list_del(&cxdev->vbuf->list);
> > -               } else
> > +               } else {
> >                         dev_warn(&dvbdev->udev->dev, "no free buffers\n");
> > +               }
> >         }
> >
> >         if (bt656->mode == NEW_FRAME || reset) {
> > @@ -516,7 +517,7 @@ static bool cxusb_medion_v_process_auxbuf(struct cxusb_medion_dev *cxdev,
> >                 bt656->fmode = START_SEARCH;
> >                 bt656->line = 0;
> >
> > -               if (cxdev->vbuf != NULL) {
> > +               if (cxdev->vbuf) {
> >                         cxdev->vbuf->vb2.vb2_buf.timestamp = ktime_get_ns();
> >                         bt656->buf = vb2_plane_vaddr(&cxdev->vbuf->vb2.vb2_buf,
> >                                                      0);
> > @@ -550,7 +551,7 @@ static bool cxusb_medion_v_process_auxbuf(struct cxusb_medion_dev *cxdev,
> >
> >                 bt656->mode = NEW_FRAME;
> >
> > -               if (cxdev->vbuf != NULL) {
> > +               if (cxdev->vbuf) {
> >                         vb2_set_plane_payload(&cxdev->vbuf->vb2.vb2_buf, 0,
> >                                               cxdev->width * cxdev->height * 2);
> >
> > @@ -593,7 +594,7 @@ static bool cxusb_medion_v_complete_handle_urb(struct cxusb_medion_dev *cxdev,
> >                 cxdev->nexturb++;
> >                 cxdev->nexturb %= CXUSB_VIDEO_URBS;
> >                 urb = cxdev->streamurbs[cxdev->nexturb];
> > -       } while (urb == NULL);
> > +       } while (!urb);
> >
> >         urb = cxdev->streamurbs[urbn];
> >         cxusb_vprintk(dvbdev, URB, "URB %u status = %d\n", urbn, urb->status);
> > @@ -609,9 +610,9 @@ static bool cxusb_medion_v_complete_handle_urb(struct cxusb_medion_dev *cxdev,
> >                               len);
> >
> >                 if (len > 0) {
> > -                       if (cxdev->raw_mode)
> > +                       if (cxdev->raw_mode) {
> >                                 cxusb_medion_v_process_urb_raw(cxdev, urb);
> > -                       else {
> > +                       } else {
> >                                 cxusb_vprintk(dvbdev, URB, "appending URB\n");
> >
> >                                 /*
> > @@ -704,7 +705,7 @@ static void cxusb_medion_urbs_free(struct cxusb_medion_dev *cxdev)
> >         unsigned int i;
> >
> >         for (i = 0; i < CXUSB_VIDEO_URBS; i++)
> > -               if (cxdev->streamurbs[i] != NULL) {
> > +               if (cxdev->streamurbs[i]) {
> >                         kfree(cxdev->streamurbs[i]->transfer_buffer);
> >                         usb_free_urb(cxdev->streamurbs[i]);
> >                         cxdev->streamurbs[i] = NULL;
> > @@ -724,7 +725,7 @@ static void cxusb_medion_return_buffers(struct cxusb_medion_dev *cxdev,
> >                                 VB2_BUF_STATE_ERROR);
> >         }
> >
> > -       if (cxdev->vbuf != NULL) {
> > +       if (cxdev->vbuf) {
> >                 vb2_buffer_done(&cxdev->vbuf->vb2.vb2_buf,
> >                                 requeue ? VB2_BUF_STATE_QUEUED :
> >                                 VB2_BUF_STATE_ERROR);
> > @@ -763,7 +764,7 @@ static int cxusb_medion_v_ss_auxbuf_alloc(struct cxusb_medion_dev *cxdev,
> >         auxbuflen = framelen + urblen;
> >
> >         buf = vmalloc(auxbuflen);
> > -       if (buf == NULL)
> > +       if (!buf)
> >                 return -ENOMEM;
> >
> >         cxusb_auxbuf_init(dvbdev, &cxdev->auxbuf, buf, auxbuflen);
> > @@ -804,11 +805,11 @@ static u32 cxusb_medion_field_order(struct cxusb_medion_dev *cxdev)
> >                 return field;
> >
> >         ret = v4l2_subdev_call(cxdev->cx25840, video, g_std, &norm);
> > -       if (ret != 0)
> > +       if (ret != 0) {
> >                 cxusb_vprintk(dvbdev, OPS,
> >                               "cannot get current standard for input %u\n",
> >                               (unsigned int)cxdev->input);
> > -       else {
> > +       } else {
> >                 field = cxusb_medion_norm2field_order(norm);
> >                 if (field != V4L2_FIELD_NONE)
> >                         return field;
> > @@ -853,9 +854,9 @@ static int cxusb_medion_v_start_streaming(struct vb2_queue *q,
> >                 goto ret_unstream_cx;
> >         }
> >
> > -       if (cxdev->raw_mode)
> > +       if (cxdev->raw_mode) {
> >                 npackets = CXUSB_VIDEO_MAX_FRAME_PKTS;
> > -       else {
> > +       } else {
> >                 ret = cxusb_medion_v_ss_auxbuf_alloc(cxdev, &npackets);
> >                 if (ret != 0)
> >                         goto ret_unstream_md;
> > @@ -873,16 +874,16 @@ static int cxusb_medion_v_start_streaming(struct vb2_queue *q,
> >                  */
> >                 streambuf = kmalloc(npackets * CXUSB_VIDEO_PKT_SIZE,
> >                                     GFP_KERNEL);
> > -               if (streambuf == NULL) {
> > +               if (!streambuf) {
> >                         if (i < 2) {
> >                                 ret = -ENOMEM;
> >                                 goto ret_freeab;
> > -                       } else
> > -                               break;
> > +                       }
> > +                       break;
> >                 }
> >
> >                 surb = usb_alloc_urb(npackets, GFP_KERNEL);
> > -               if (surb == NULL) {
> > +               if (!surb) {
> >                         kfree(streambuf);
> >                         ret = -ENOMEM;
> >                         goto ret_freeu;
> > @@ -922,9 +923,9 @@ static int cxusb_medion_v_start_streaming(struct vb2_queue *q,
> >         }
> >
> >         for (i = 0; i < CXUSB_VIDEO_URBS; i++)
> > -               if (cxdev->streamurbs[i] != NULL) {
> > +               if (cxdev->streamurbs[i]) {
> >                         ret = usb_submit_urb(cxdev->streamurbs[i],
> > -                                       GFP_KERNEL);
> > +                                            GFP_KERNEL);
> >                         if (ret != 0)
> >                                 dev_err(&dvbdev->udev->dev,
> >                                         "URB %d submission failed (%d)\n", i,
> > @@ -977,7 +978,7 @@ static void cxusb_medion_v_stop_streaming(struct vb2_queue *q)
> >         mutex_unlock(cxdev->videodev->lock);
> >
> >         for (i = 0; i < CXUSB_VIDEO_URBS; i++)
> > -               if (cxdev->streamurbs[i] != NULL)
> > +               if (cxdev->streamurbs[i])
> >                         usb_kill_urb(cxdev->streamurbs[i]);
> >
> >         flush_work(&cxdev->urbwork);
> > @@ -1626,7 +1627,7 @@ int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
> >                                cxusub_medion_pin_config);
> >         if (ret != 0)
> >                 dev_warn(&dvbdev->udev->dev,
> > -                       "cx25840 pin config failed (%d)\n", ret);
> > +                        "cx25840 pin config failed (%d)\n", ret);
> >
> >         /* make sure that we aren't in radio mode */
> >         v4l2_subdev_call(cxdev->tda9887, video, s_std, cxdev->norm);
> > @@ -1771,7 +1772,7 @@ static int cxusb_medion_register_analog_video(struct dvb_usb_device *dvbdev)
> >         }
> >
> >         cxdev->videodev = video_device_alloc();
> > -       if (cxdev->videodev == NULL) {
> > +       if (!cxdev->videodev) {
> >                 dev_err(&dvbdev->udev->dev, "video device alloc failed\n");
> >                 ret = -ENOMEM;
> >                 goto ret_qrelease;
> > @@ -1813,7 +1814,7 @@ static int cxusb_medion_register_analog_radio(struct dvb_usb_device *dvbdev)
> >         int ret;
> >
> >         cxdev->radiodev = video_device_alloc();
> > -       if (cxdev->radiodev == NULL) {
> > +       if (!cxdev->radiodev) {
> >                 dev_err(&dvbdev->udev->dev, "radio device alloc failed\n");
> >                 return -ENOMEM;
> >         }
> > @@ -1849,7 +1850,7 @@ static int cxusb_medion_register_analog_subdevs(struct dvb_usb_device *dvbdev)
> >         cxdev->cx25840 = v4l2_i2c_new_subdev(&cxdev->v4l2dev,
> >                                              &dvbdev->i2c_adap,
> >                                              "cx25840", 0x44, NULL);
> > -       if (cxdev->cx25840 == NULL) {
> > +       if (!cxdev->cx25840) {
> >                 dev_err(&dvbdev->udev->dev, "cx25840 not found\n");
> >                 return -ENODEV;
> >         }
> > @@ -1874,7 +1875,7 @@ static int cxusb_medion_register_analog_subdevs(struct dvb_usb_device *dvbdev)
> >                                CX25840_VCONFIG_DCMODE_DWORDS);
> >         if (ret != 0) {
> >                 dev_err(&dvbdev->udev->dev,
> > -                        "cx25840 init failed (%d)\n", ret);
> > +                       "cx25840 init failed (%d)\n", ret);
> >                 return ret;
> >         }
> >
> > @@ -1882,7 +1883,7 @@ static int cxusb_medion_register_analog_subdevs(struct dvb_usb_device *dvbdev)
> >         cxdev->tuner = v4l2_i2c_new_subdev(&cxdev->v4l2dev,
> >                                            &dvbdev->i2c_adap,
> >                                            "tuner", 0x61, NULL);
> > -       if (cxdev->tuner == NULL) {
> > +       if (!cxdev->tuner) {
> >                 dev_err(&dvbdev->udev->dev, "tuner not found\n");
> >                 return -ENODEV;
> >         }
> > @@ -1898,7 +1899,7 @@ static int cxusb_medion_register_analog_subdevs(struct dvb_usb_device *dvbdev)
> >         cxdev->tda9887 = v4l2_i2c_new_subdev(&cxdev->v4l2dev,
> >                                              &dvbdev->i2c_adap,
> >                                              "tuner", 0x43, NULL);
> > -       if (cxdev->tda9887 == NULL) {
> > +       if (!cxdev->tda9887) {
> >                 dev_err(&dvbdev->udev->dev, "tda9887 not found\n");
> >                 return -ENODEV;
> >         }
> > --
> > 2.21.0
> >  



Thanks,
Mauro

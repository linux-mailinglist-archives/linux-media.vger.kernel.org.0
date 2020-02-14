Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C883415E64B
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 17:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393077AbgBNQqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 11:46:52 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51738 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389550AbgBNQqv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 11:46:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id t23so10618600wmi.1;
        Fri, 14 Feb 2020 08:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A1PbDdtYgd7eIzgKkWykMOQVO3VO/61EFdSbHrXJXFY=;
        b=KWbwuGICqb34KVFQ3jHfYb0adTm/KQL5iUBzkow0vRMO2XQNIY16b1vVu/CjOg0dvl
         kHXsmdrq+OMB975yJkTYIxg9UssL5e9bqlYouLU3oUclA7HTag17h1EU7fcRFnzc9+/7
         4eS8EYed9FahaCjuEfqcckjHtuTx5lF3K73mP+tXFOMUqpjv95bfWmRZy2Hcfnvd0YL1
         tefnqxl40KbJZNJyUrbEkXmsU68pGc5IRdV+txtReQ3r+q8B4JYiZiDCZNXoADBEV51K
         eeUvVbzf0y2jL5HM56d2QTnLW6B3Ik3Cvpr8g9WSb8nWCRkCTFkFNVgf8FcrFcZQJY7Y
         Picg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A1PbDdtYgd7eIzgKkWykMOQVO3VO/61EFdSbHrXJXFY=;
        b=dsf/VrRrNnY2HsGEwTARKVKOW3BW8fhpqHbREfTx24i2cZzpkPUZ8Oi3zX7CFOpFYN
         GryqxvLiZUtsZ8K3EzGpwk2OoH2y/wGTl8Mt0PRSkeXTW0dKKevqdHwWcr1H2Bg2tbVP
         fay1S1UEuUbiLRWIwKsztuKg78pSjTDr7+eSJmT6tQmRtwa0+3XwsoEJBNUU1mscQt9t
         g3x73g2uD5D8Y6Yk7lioE55OB3HK2BM6juNhV7PuHcp1embsELfAW7KMBi6ldPnVcStb
         DHjPmbmszQyOAKdEE5YgpgYEf4/s6dZXF6r54KgrErLERdyO3ifHIemxphAN65i8EAWq
         8ylw==
X-Gm-Message-State: APjAAAX/9PwNsjkehXeHPQRvJdczIwpv2+J/1G+7Sj2BYhRbY7IHZyMf
        kxpVw3j/yw5d0K2kowoC7xI=
X-Google-Smtp-Source: APXvYqyF3XpdaM4IdFu2CaSKS00hpJ0X2NgcXVWbskC5SW8fFQOccCxVcWPv2ZRjPgzWMyeKv5NHpg==
X-Received: by 2002:a1c:4d07:: with SMTP id o7mr5696440wmh.174.1581698808420;
        Fri, 14 Feb 2020 08:46:48 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id c77sm7872215wmd.12.2020.02.14.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:46:47 -0800 (PST)
Date:   Fri, 14 Feb 2020 17:46:42 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        helen.koike@collabora.com, sboyd@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 4/6] media: tegra: Add Tegra210 Video input driver
Message-ID: <20200214164642.GA1310813@ulmo>
References: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
 <1580937806-17376-5-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <1580937806-17376-5-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2020 at 01:23:24PM -0800, Sowjanya Komatineni wrote:
[...]
> +static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
> +				       struct tegra_channel_buffer *buf)
> +{
> +	int err = 0;
> +	u32 thresh, value, frame_start;
> +	int bytes_per_line = chan->format.bytesperline;
> +
> +	/* program buffer address by using surface 0 */
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB, 0x0);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
> +	vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
> +
> +	/* increase syncpoint max */
> +	thresh = host1x_syncpt_incr_max(chan->sp, 1);
> +
> +	/* program syncpoint */
> +	frame_start = VI_CSI_PP_FRAME_START(chan->portno);
> +	value = VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
> +		host1x_syncpt_id(chan->sp);
> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);

Okay, so this programs the VI to increment the given syncpoint upon
frame start? What is that VI_CSI_PP_FRAME_START(chan->portno) exactly?

> +
> +	vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);

And now we start capturing in single-shot mode.

> +
> +	/* move buffer to capture done queue */
> +	spin_lock(&chan->done_lock);
> +	list_add_tail(&buf->queue, &chan->done);
> +	spin_unlock(&chan->done_lock);
> +
> +	/* wait up kthread for capture done */
> +	wake_up_interruptible(&chan->done_wait);

But this I don't understand. You wake up the kthread...

> +
> +	/* use syncpoint to wake up */
> +	err = host1x_syncpt_wait(chan->sp, thresh,
> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);

... and then wait for the syncpoint to reach the given threshold? Isn't
that the wrong way around? Don't we need to wait for the syncpoint
increment *before* we wake up the kthread that will return the buffer
to userspace?

> +	if (err) {
> +		dev_err(&chan->video.dev,
> +			"frame start syncpt timeout: %d\n", err);
> +		tegra_channel_capture_error_status(chan);
> +	}
> +
> +	return err;
> +}
> +
> +static int tegra_channel_capture_done(struct tegra_vi_channel *chan,
> +				      struct tegra_channel_buffer *buf)
> +{
> +	struct vb2_v4l2_buffer *vb = &buf->buf;
> +	u32 thresh, value, mw_ack_done;
> +	int ret = 0;
> +
> +	/* increase syncpoint max */
> +	thresh = host1x_syncpt_incr_max(chan->sp, 1);
> +
> +	/* program syncpoint */
> +	mw_ack_done = VI_CSI_MW_ACK_DONE(chan->portno);
> +	value = VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
> +		host1x_syncpt_id(chan->sp);
> +	tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
> +
> +	if (!vi_csi_read(chan, TEGRA_VI_CSI_SINGLE_SHOT))
> +		vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT,
> +			     SINGLE_SHOT_CAPTURE);
> +
> +	/* use syncpoint to wake up */
> +	ret = host1x_syncpt_wait(chan->sp, thresh,
> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
> +	if (ret)
> +		dev_err(&chan->video.dev,
> +			"MW_ACK_DONE syncpoint timeout: %d\n", ret);

Actually... there's another syncpoint wait here, so I guess this will
stall until VI has actually completed writing the captured frame to
memory.

> +
> +	/* captured one frame */
> +	vb->sequence = chan->sequence++;
> +	vb->field = V4L2_FIELD_NONE;
> +	vb->vb2_buf.timestamp = ktime_get_ns();
> +	vb2_buffer_done(&vb->vb2_buf,
> +			ret < 0 ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE);

So it's really only at this point that we return the buffer to
userspace, which should be after the hardware is done writing to the
buffer, so this should be fine.

That said, I'm wondering if host1x_syncpt_wait() is a good interface
for this use-case. We don't really have anything else right now, but
I think we may be able to add something to have a function called in
case the syncpoint reaches a threshold. Having to spawn two separate
threads with wait queues seems a bit overkill for this.

It's fine to leave this as it is for now, but maybe something to
consider as improvement in the future.

> +	return ret;
> +}
> +
> +static int chan_capture_kthread_start(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +	int err = 0;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();
> +
> +		wait_event_interruptible(chan->start_wait,
> +					 !list_empty(&chan->capture) ||
> +					 kthread_should_stop());
> +		if (kthread_should_stop())
> +			break;
> +
> +		if (err)
> +			continue;
> +
> +		spin_lock(&chan->start_lock);
> +		if (list_empty(&chan->capture)) {
> +			spin_unlock(&chan->start_lock);
> +			continue;
> +		}
> +
> +		buf = list_entry(chan->capture.next,
> +				 struct tegra_channel_buffer, queue);
> +		list_del_init(&buf->queue);
> +		spin_unlock(&chan->start_lock);
> +		err = tegra_channel_capture_frame(chan, buf);
> +	}
> +
> +	return 0;
> +}
> +
> +static int chan_capture_kthread_done(void *data)
> +{
> +	struct tegra_vi_channel *chan = data;
> +	struct tegra_channel_buffer *buf;
> +	int err = 0;
> +
> +	set_freezable();
> +
> +	while (1) {
> +		try_to_freeze();
> +
> +		wait_event_interruptible(chan->done_wait,
> +					 !list_empty(&chan->done) ||
> +					 kthread_should_stop());
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		spin_lock(&chan->done_lock);
> +		if (list_empty(&chan->done)) {
> +			spin_unlock(&chan->done_lock);
> +			continue;
> +		}
> +
> +		buf = list_entry(chan->done.next, struct tegra_channel_buffer,
> +				 queue);
> +		if (!buf)
> +			continue;
> +
> +		list_del_init(&buf->queue);
> +		spin_unlock(&chan->done_lock);
> +		err = tegra_channel_capture_done(chan, buf);

What's with the error here? I think we should either handle it in some
way, or just avoid even returning an error if we're not going to deal
with it anyway.

Thierry

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5Gzu4ACgkQ3SOs138+
s6Hd1w/+INwB+uEPRluAC0zs+uoEeVtXd/JX1Fz5YqyKmaJ9Lp/WNj9RHfluVU2K
r7mIGLq2ia8bLekfTdh3+YX6uaHfPIDhlHNsE3yiCseiIH1mIYdNXgUng+8v9KbJ
T8/84ICFZSc2fb4rhYhivXJ61JqGkRK5dh8dl1HVqgvdYmjofivHQCZcUXlUvq1x
q7iBVXE3U762/FYGfA7v09BHejAnT5G2TUcnOkQknFk2XZi+uEgIVgxgz9MMz6Bw
1bf2Za2wbfm4LFO7e2kjahZy/tHdrNOE7Nyz62fbYEybev5G6IDT16kGpsnGpsf2
kJ8ohkuyYxsROI1uxoO5C1Uvsi52worYljuDlXlXuYwtfVFmky4Yyk8diO9b8TmP
6ImPP6v9XO7cyyJG1A97Gk0sm4gCJbbKsNvahA9niPwPqlJsww+qvczhxBVvsIDb
iqc6zFRPOYpPV3oyvjX0sQi27iBF5MsoxN9TpK7Ow7qhnoBmf7jJczVwdeHTCmHE
HWIuaVrTiy9mY02T0GXbxHD9daOgxPFcfVbudsyX1NOxRjtreN16Bfc1bDX0Awlg
VoimBA8iVkP7u3Igpyr3q1FhVrCfdeN9yZBrwI44aiEOa7i6D1sAf1bgC2VZ+L1U
mhfXc3eLZZq3NfKdS2SpQ99Mq46lTV//ORM0LuiRY6k9mQuSqog=
=StqB
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

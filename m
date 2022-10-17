Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC666012AE
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 17:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiJQPX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 11:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiJQPX5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 11:23:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D05622295;
        Mon, 17 Oct 2022 08:23:56 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FAF3CCF;
        Mon, 17 Oct 2022 17:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1666020234;
        bh=DltY8pcDH0JhjbrZrMewyQKbVIkGbFx73kY1D/dIVjA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I5NDZm17aYF0F/75KzT2rsv9VRkgElBVkcXJd7TtXjCZDhY1DTgqkutVO+Lzn/mrf
         LPfXHmWUOJYtFI09Ew2NmcV7PGS5oslP3P626feBLVm/hzXcfpJSoPfUo9T2YIc1ns
         5l7l97jDebAY5gTf0lqqDLk8fVGTRBNQwm0GITQI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <89dcd314-37bb-b944-b7e6-b6c71a3514fc@linaro.org>
References: <20221013121255.1977-1-quic_mmitkov@quicinc.com> <1a7ab9da-e7fb-9077-5d6e-705629bb2b10@linaro.org> <166601200198.3760285.1520904024668899853@Monstersaurus> <89dcd314-37bb-b944-b7e6-b6c71a3514fc@linaro.org>
Subject: Re: [PATCH v4 0/4] media: camss: sm8250: Virtual channels support for SM8250
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     agross@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, cgera@qti.qualcomm.com, gchinnab@quicinc.com,
        ayasan@qti.qualcomm.com, laurent.pinchart@ideasonboard.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        akapatra@quicinc.com, jzala@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        quic_mmitkov@quicinc.com, robert.foss@linaro.org,
        todor.too@gmail.com
Date:   Mon, 17 Oct 2022 16:23:51 +0100
Message-ID: <166602023184.2677993.9915646081546526687@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Bryan O'Donoghue (2022-10-17 15:22:10)
> On 17/10/2022 14:06, Kieran Bingham wrote:
> > Quoting Bryan O'Donoghue (2022-10-17 01:16:05)
> >> On 13/10/2022 13:12, quic_mmitkov@quicinc.com wrote:
> >>> From: Milen Mitkov <quic_mmitkov@quicinc.com>
> >>>
> >>> For v4:
> >>> - fixes the warning reported by the kernel test robot
> >>> - tiny code change to enable the vc functionality with the partially-=
applied
> >>>     multistream patches on linux-next (tested on tag:next-20221010)
> >>>
> >>> For v3:
> >>> - setting the sink pad format on the CSID entity will now propagate t=
he
> >>>     format to the source pads to keep the subdev in a valid internal =
state.
> >>> - code syntax improvements
> >>>
> >>> For v2:
> >>> - code syntax improvements
> >>> - The info print for the enabled VCs was demoted to a dbg print. Can =
be
> >>>     enabled with dynamic debug, e.g.:
> >>> echo "file drivers/media/platform/qcom/camss/* +p" > /sys/kernel/debu=
g/dynamic_debug/control
> >>>
> >>> NOTE: These changes depend on the multistream series, that as of yet
> >>> is still not merged upstream. However, part of the
> >>> multistream patches are merged in linux-next (tested on
> >>> tag:next-20221010), including the patch that introduces the
> >>> video_device_pipeline_alloc_start() functionality. This allows
> >>> applying and using this series on linux-next without applying the
> >>> complete multistream set.
> >>>
> >>> The CSID hardware on SM8250 can demux the input data stream into
> >>> maximum of 4 multiple streams depending on virtual channel (vc)
> >>> or data type (dt) configuration.
> >>>
> >>> Situations in which demuxing is useful:
> >>> - HDR sensors that produce a 2-frame HDR output, e.g. a light and a d=
ark frame
> >>>     (the setup we used for testing, with the imx412 sensor),
> >>>     or a 3-frame HDR output - light, medium-lit, dark frame.
> >>> - sensors with additional metadata that is streamed over a different
> >>>     virtual channel/datatype.
> >>> - sensors that produce frames with multiple resolutions in the same p=
ixel
> >>>     data stream
> >>>
> >>> With these changes, the CSID entity has, as it did previously, a sing=
le
> >>> sink port (0), and always exposes 4 source ports (1, 2,3, 4). The
> >>> virtual channel configuration is determined by which of the source po=
rts
> >>> are linked to an output VFE line. For example, the link below will
> >>> configure the CSID driver to enable vc 0 and vc 1:
> >>>
> >>> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> >>> media-ctl -l '"msm_csid0":2->"msm_vfe0_rdi1":0[1]'
> >>>
> >>> which will be demuxed and propagated into /dev/video0
> >>> and /dev/video1 respectively. With this, the userspace can use
> >>> any normal V4L2 client app to start/stop/queue/dequeue from these
> >>> video nodes. Tested with the yavta app.
> >>>
> >>> The format of each RDI channel of the used VFE(s) (msm_vfe0_rdi0,
> >>> msm_vfe0_rdi1,...) must also be configured explicitly.
> >>>
> >>> Note that in order to keep a valid internal subdevice state,
> >>> setting the sink pad format of the CSID subdevice will propagate
> >>> this format to the source pads. However, since the CSID hardware
> >>> can demux the input stream into several streams each of which can
> >>> be a different format, in that case each source pad's
> >>> format must be set individually, e.g.:
> >>>
> >>> media-ctl -V '"msm_csid0":1[fmt:SRGGB10/3840x2160]'
> >>> media-ctl -V '"msm_csid0":2[fmt:SRGGB10/960x540]'
> >>>
> >>> Milen Mitkov (4):
> >>>     media: camss: sm8250: Virtual channels for CSID
> >>>     media: camss: vfe: Reserve VFE lines on stream start and link to =
CSID
> >>>     media: camss: vfe-480: Multiple outputs support for SM8250
> >>>     media: camss: sm8250: Pipeline starting and stopping for multiple
> >>>       virtual channels
> >>>
> >>>    .../platform/qcom/camss/camss-csid-gen2.c     | 54 ++++++++++------
> >>>    .../media/platform/qcom/camss/camss-csid.c    | 44 +++++++++----
> >>>    .../media/platform/qcom/camss/camss-csid.h    | 11 +++-
> >>>    .../media/platform/qcom/camss/camss-vfe-480.c | 61 ++++++++++++---=
----
> >>>    drivers/media/platform/qcom/camss/camss-vfe.c |  7 +++
> >>>    .../media/platform/qcom/camss/camss-video.c   | 21 ++++++-
> >>>    drivers/media/platform/qcom/camss/camss.c     |  2 +-
> >>>    7 files changed, 140 insertions(+), 60 deletions(-)
> >>>
> >>
> >> Hi Milen
> >>
> >> The set applies to next-20221013 including patch#4.
> >>
> >> I can confirm it doesn't break anything for me - though my sensor is a
> >> bog-standard imx577 so it doesn't have any VC support.
> >=20
> > Interesting though - the IMX477 has the ability to convey metadata on a
> > separate VC... That's actually the thing holding back the RPi IMX477
> > driver from mainline, as the way it was anticipated to support multiple
> > data streams is with the new multiplexed streams API.
> >=20
> > And I think we inferred that the IMX577 and IMX477 are closely related,
> > so should have similar capabilities for obtaining metadata channels?
>=20
> Hmm I was not aware of that.
>=20
> If we could import the rpi/imx477.c code into upstrea/imx412.c it might=20
> be possible
>=20
> The core init is very similar
>=20
> https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/im=
x477.c#L167
>=20
> https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/im=
x412.c#L160
>=20
> Maybe it would be possible to apply the rest of the imx477 config on-top =

> as a POC
>=20
> https://github.com/raspberrypi/linux/blob/rpi-5.19.y/drivers/media/i2c/im=
x477.c#L479
>=20
> The similary is born out by the shared init code I can see in Leopard=20
> imaging's driver, I'm not sure if it supports virtual-channels - I'll=20
> have a look, though.
>=20
> What's in the imx477 meta-data ?

The exact exposure of the captured frame, exact gain, and frame length,
and even the temperature of the sensor at the time of capture (not sure
at /which/ time if this is a long exposure).


https://git.libcamera.org/libcamera/libcamera.git/tree/src/ipa/raspberrypi/=
cam_helper_imx477.cpp#n168

"""
void CamHelperImx477::populateMetadata(const MdParser::RegisterMap &registe=
rs,
				       Metadata &metadata) const
{
	DeviceStatus deviceStatus;

	deviceStatus.shutterSpeed =3D exposure(registers.at(expHiReg) * 256 + regi=
sters.at(expLoReg));
	deviceStatus.analogueGain =3D gain(registers.at(gainHiReg) * 256 + registe=
rs.at(gainLoReg));
	deviceStatus.frameLength =3D registers.at(frameLengthHiReg) * 256 + regist=
ers.at(frameLengthLoReg);
	deviceStatus.sensorTemperature =3D std::clamp<int8_t>(registers.at(tempera=
tureReg), -20, 80);

	metadata.set("device.status", deviceStatus);
}

"""

Having the embedded metadata from the sensor helps to ensure accurate
handling in the control loops, so I believe we would always prefer to
reference this when available, rather than what we 'think' we have
programmed. (Which due to timing, or any other error - might not be as
accurate as what the metadata will report).
--
Kieran


>=20
> @Milen if you have the imx577 datasheet - I don't - perhaps we could=20
> cherry-pick some of the code from imx477 and get the imx412.c->imx577=20
> dumping VC data out with the RB5 camera mezzanine.
>=20
> ---
> bod

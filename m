Return-Path: <linux-media+bounces-38579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9EB13DCA
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3861C3BE015
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AE31F30CC;
	Mon, 28 Jul 2025 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eJlVo7Eh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21E37E9
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753714874; cv=none; b=l7qE3dMOv2Gcxzmhhf7jg6p/pt1aX4HN49Cu8Xn8XGnZToyEUeWg1kaPiLYbT/9UIjPSR7OG9e0Intrp0JxgiGHY/aWeOFZQjHxpd8tT/fo2kiWKUrxLVrn5rnY2Hu949iin/FvmDChUhWk03qqhbrefqSOLXniqLFfBmk8CTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753714874; c=relaxed/simple;
	bh=nFehAzByqiDjXPNaMkfKrT5Q0agEVNdamPZjXxYKaD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeaSS4wU9Bctln23GmD3W/+P7eKesrssgK89DDUEVuVI13YKsWfTRpxtHZaDKpzHEf88qW9ieaKhw8y0fWFgdDlIxgc50mq09KzqxXwt4C/sNaaBL5i3FaIwp7yC7fDMU0R0+CdQYD0aBWe8r/w9JIBay5iMAI4LzZr9RlvOXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eJlVo7Eh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 818A5446;
	Mon, 28 Jul 2025 17:00:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753714824;
	bh=nFehAzByqiDjXPNaMkfKrT5Q0agEVNdamPZjXxYKaD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJlVo7EhELfs6vZcb5lXqM1pI3F4k8RpH8Id4w2WtVxgy2tpdy+ieVsbWBEqdlE1O
	 PhIZvV38b+3jHuH9eLLUK+J+VPwzMCQmBubzYhFZYqCbOvMwl6htMIQAnRaCD47xfm
	 +HUIIwySYBRvBz0cPnTlagBbpr2QV/YiGcq4LO8E=
Date: Mon, 28 Jul 2025 17:00:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 40/64] media: Documentation: Add subdev configuration
 models, raw sensor model
Message-ID: <b6tut2zockb2fwdmenmmrmgnmepqgzvrl2heeuqvf4wilnqfbq@afs5nzielzsc>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-41-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619115836.1946016-41-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:58:12PM +0300, Sakari Ailus wrote:
> Sub-device configuration models define what V4L2 API elements are
> available on a compliant sub-device and how do they behave.
>
> The patch also adds a model for common raw sensors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../media/drivers/camera-sensor.rst           |   4 +
>  .../media/v4l/common-raw-sensor.dia           | 442 ++++++++++++++++++
>  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../media/v4l/subdev-config-model.rst         | 230 +++++++++
>  5 files changed, 812 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sens=
or.dia
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sens=
or.svg
>  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-m=
odel.rst
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst =
b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index cbbfbb0d8273..39f3f91c6733 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -18,6 +18,8 @@ binning functionality. The sensor drivers belong to two=
 distinct classes, freely
>  configurable and register list-based drivers, depending on how the driver
>  configures this functionality.
>
> +Also see :ref:`media_subdev_config_model_common_raw_sensor`.
> +
>  Freely configurable camera sensor drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> @@ -118,6 +120,8 @@ values programmed by the register sequences. The defa=
ult values of these
>  controls shall be 0 (disabled). Especially these controls shall not be i=
nverted,
>  independently of the sensor's mounting rotation.
>
> +.. _media_using_camera_sensor_drivers_embedded_data:
> +
>  Embedded data
>  -------------
>
> diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.dia =
b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> new file mode 100644
> index 000000000000..24b3f2b2a626
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/common-raw-sensor.dia
> @@ -0,0 +1,442 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<dia:diagram xmlns:dia=3D"http://www.lysator.liu.se/~alla/dia/">
> +  <dia:diagramdata>
> +    <dia:attribute name=3D"background">
> +      <dia:color val=3D"#ffffffff"/>
> +    </dia:attribute>
> +    <dia:attribute name=3D"pagebreak">
> +      <dia:color val=3D"#000099ff"/>
> +    </dia:attribute>
> +    <dia:attribute name=3D"paper">
> +      <dia:composite type=3D"paper">
> +        <dia:attribute name=3D"name">
> +          <dia:string>#A4#</dia:string>
> +        </dia:attribute>
> +        <dia:attribute name=3D"tmargin">
> +          <dia:real val=3D"2.8222"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"bmargin">
> +          <dia:real val=3D"2.8222"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"lmargin">
> +          <dia:real val=3D"2.8222"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"rmargin">
> +          <dia:real val=3D"2.8222"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"is_portrait">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"scaling">
> +          <dia:real val=3D"1"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"fitto">
> +          <dia:boolean val=3D"false"/>
> +        </dia:attribute>
> +      </dia:composite>
> +    </dia:attribute>
> +    <dia:attribute name=3D"grid">
> +      <dia:composite type=3D"grid">
> +        <dia:attribute name=3D"dynamic">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"width_x">
> +          <dia:real val=3D"1"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"width_y">
> +          <dia:real val=3D"1"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"visible_x">
> +          <dia:int val=3D"1"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"visible_y">
> +          <dia:int val=3D"1"/>
> +        </dia:attribute>
> +        <dia:composite type=3D"color"/>
> +      </dia:composite>
> +    </dia:attribute>
> +    <dia:attribute name=3D"color">
> +      <dia:color val=3D"#d8e5e5ff"/>
> +    </dia:attribute>
> +    <dia:attribute name=3D"guides"/>
> +    <dia:attribute name=3D"guide_color">
> +      <dia:color val=3D"#00ff00ff"/>
> +    </dia:attribute>
> +    <dia:attribute name=3D"display">
> +      <dia:composite type=3D"display">
> +        <dia:attribute name=3D"antialiased">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"snap-to-grid">
> +          <dia:boolean val=3D"false"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"snap-to-guides">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"snap-to-object">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"show-grid">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"show-guides">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +        <dia:attribute name=3D"show-connection-points">
> +          <dia:boolean val=3D"true"/>
> +        </dia:attribute>
> +      </dia:composite>
> +    </dia:attribute>
> +  </dia:diagramdata>
> +  <dia:layer name=3D"Background" visible=3D"true" connectable=3D"false"/>
> +  <dia:layer name=3D"Background" visible=3D"true" connectable=3D"false"/>
> +  <dia:layer name=3D"Background" visible=3D"true" connectable=3D"false"/>
> +  <dia:layer name=3D"Background" visible=3D"true" connectable=3D"true" a=
ctive=3D"true">
> +    <dia:object type=3D"Standard - Box" version=3D"0" id=3D"O0">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"16.35,11.5"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"16.3,11.45;25.8,18.45"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_corner">
> +        <dia:point val=3D"16.35,11.5"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_width">
> +        <dia:real val=3D"9.4000000000000021"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_height">
> +        <dia:real val=3D"6.9000000000000021"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"show_background">
> +        <dia:boolean val=3D"true"/>
> +      </dia:attribute>
> +    </dia:object>
> +    <dia:object type=3D"Geometric - Perfect Circle" version=3D"1" id=3D"=
O1">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"25.5627,14.578"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"25.4627,14.478;26.0191,15.0344"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"meta">
> +        <dia:composite type=3D"dict"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_corner">
> +        <dia:point val=3D"25.5627,14.578"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_width">
> +        <dia:real val=3D"0.35638032780853468"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_height">
> +        <dia:real val=3D"0.35638032780853468"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_width">
> +        <dia:real val=3D"0.10000000000000001"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_colour">
> +        <dia:color val=3D"#000000ff"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"fill_colour">
> +        <dia:color val=3D"#ffffffff"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"show_background">
> +        <dia:boolean val=3D"true"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_style">
> +        <dia:enum val=3D"0"/>
> +        <dia:real val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"flip_horizontal">
> +        <dia:boolean val=3D"false"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"flip_vertical">
> +        <dia:boolean val=3D"false"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"subscale">
> +        <dia:real val=3D"1"/>
> +      </dia:attribute>
> +    </dia:object>
> +    <dia:object type=3D"Geometric - Perfect Circle" version=3D"1" id=3D"=
O2">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"17.7702,13.2656"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"17.6702,13.1656;18.24,13.7354"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"meta">
> +        <dia:composite type=3D"dict"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_corner">
> +        <dia:point val=3D"17.7702,13.2656"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_width">
> +        <dia:real val=3D"0.36980024191863681"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_height">
> +        <dia:real val=3D"0.36980024191863681"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_width">
> +        <dia:real val=3D"0.10000000000000001"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_colour">
> +        <dia:color val=3D"#000000ff"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"fill_colour">
> +        <dia:color val=3D"#ffffffff"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"show_background">
> +        <dia:boolean val=3D"true"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_style">
> +        <dia:enum val=3D"0"/>
> +        <dia:real val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"flip_horizontal">
> +        <dia:boolean val=3D"false"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"flip_vertical">
> +        <dia:boolean val=3D"false"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"subscale">
> +        <dia:real val=3D"1"/>
> +      </dia:attribute>
> +    </dia:object>
> +    <dia:object type=3D"Geometric - Perfect Circle" version=3D"1" id=3D"=
O3">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"17.7464,16.2056"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"17.6464,16.1056;18.2162,16.6754"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"meta">
> +        <dia:composite type=3D"dict"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_corner">
> +        <dia:point val=3D"17.7464,16.2056"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_width">
> +        <dia:real val=3D"0.36980024191863681"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"elem_height">
> +        <dia:real val=3D"0.36980024191863681"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_width">
> +        <dia:real val=3D"0.10000000000000001"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_colour">
> +        <dia:color val=3D"#000000ff"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"fill_colour">
> +        <dia:color val=3D"#ffffffff"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"show_background">
> +        <dia:boolean val=3D"true"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_style">
> +        <dia:enum val=3D"0"/>
> +        <dia:real val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"flip_horizontal">
> +        <dia:boolean val=3D"false"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"flip_vertical">
> +        <dia:boolean val=3D"false"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"subscale">
> +        <dia:real val=3D"1"/>
> +      </dia:attribute>
> +    </dia:object>
> +    <dia:object type=3D"Standard - Line" version=3D"0" id=3D"O4">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"18.1609,16.3413"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"18.1016,14.5712;25.6221,16.4007"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"conn_endpoints">
> +        <dia:point val=3D"18.1609,16.3413"/>
> +        <dia:point val=3D"25.5627,14.7562"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"numcp">
> +        <dia:int val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"line_style">
> +        <dia:enum val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow">
> +        <dia:enum val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow_length">
> +        <dia:real val=3D"0.5"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow_width">
> +        <dia:real val=3D"0.5"/>
> +      </dia:attribute>
> +      <dia:connections>
> +        <dia:connection handle=3D"0" to=3D"O3" connection=3D"8"/>
> +        <dia:connection handle=3D"1" to=3D"O1" connection=3D"2"/>
> +      </dia:connections>
> +    </dia:object>
> +    <dia:object type=3D"Standard - Line" version=3D"0" id=3D"O5">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"18.14,13.4505"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"18.0821,13.3926;25.6206,14.9674"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"conn_endpoints">
> +        <dia:point val=3D"18.14,13.4505"/>
> +        <dia:point val=3D"25.5627,14.7562"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"numcp">
> +        <dia:int val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow">
> +        <dia:enum val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow_length">
> +        <dia:real val=3D"0.5"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow_width">
> +        <dia:real val=3D"0.5"/>
> +      </dia:attribute>
> +      <dia:connections>
> +        <dia:connection handle=3D"0" to=3D"O2" connection=3D"3"/>
> +        <dia:connection handle=3D"1" to=3D"O1" connection=3D"2"/>
> +      </dia:connections>
> +    </dia:object>
> +    <dia:object type=3D"Standard - Line" version=3D"0" id=3D"O6">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"25.919,14.7562"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"25.8686,14.3879;31.0068,15.0497"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"conn_endpoints">
> +        <dia:point val=3D"25.919,14.7562"/>
> +        <dia:point val=3D"30.9564,14.7131"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"numcp">
> +        <dia:int val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow">
> +        <dia:enum val=3D"1"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow_length">
> +        <dia:real val=3D"0.5"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"end_arrow_width">
> +        <dia:real val=3D"0.5"/>
> +      </dia:attribute>
> +      <dia:connections>
> +        <dia:connection handle=3D"0" to=3D"O1" connection=3D"3"/>
> +      </dia:connections>
> +    </dia:object>
> +    <dia:object type=3D"Standard - Text" version=3D"1" id=3D"O7">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"17.9551,13.2656"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"17.9551,12.5181;22.7051,13.2656"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"text">
> +        <dia:composite type=3D"text">
> +          <dia:attribute name=3D"string">
> +            <dia:string>#image data (1)#</dia:string>
> +          </dia:attribute>
> +          <dia:attribute name=3D"font">
> +            <dia:font family=3D"sans" style=3D"0" name=3D"Helvetica"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"height">
> +            <dia:real val=3D"0.80000000000000004"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"pos">
> +            <dia:point val=3D"17.9551,13.1131"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"color">
> +            <dia:color val=3D"#000000ff"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"alignment">
> +            <dia:enum val=3D"0"/>
> +          </dia:attribute>
> +        </dia:composite>
> +      </dia:attribute>
> +      <dia:attribute name=3D"valign">
> +        <dia:enum val=3D"1"/>
> +      </dia:attribute>
> +      <dia:connections>
> +        <dia:connection handle=3D"0" to=3D"O2" connection=3D"1"/>
> +      </dia:connections>
> +    </dia:object>
> +    <dia:object type=3D"Standard - Text" version=3D"1" id=3D"O8">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"17.9313,16.5754"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"17.9313,16.5754;25.1825,17.379"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"text">
> +        <dia:composite type=3D"text">
> +          <dia:attribute name=3D"string">
> +            <dia:string>#embedded data (n - 1)#</dia:string>
> +          </dia:attribute>
> +          <dia:attribute name=3D"font">
> +            <dia:font family=3D"sans" style=3D"0" name=3D"Helvetica"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"height">
> +            <dia:real val=3D"0.80000000000000004"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"pos">
> +            <dia:point val=3D"17.9313,17.1891"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"color">
> +            <dia:color val=3D"#000000ff"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"alignment">
> +            <dia:enum val=3D"0"/>
> +          </dia:attribute>
> +        </dia:composite>
> +      </dia:attribute>
> +      <dia:attribute name=3D"valign">
> +        <dia:enum val=3D"0"/>
> +      </dia:attribute>
> +      <dia:connections>
> +        <dia:connection handle=3D"0" to=3D"O3" connection=3D"0"/>
> +      </dia:connections>
> +    </dia:object>
> +    <dia:object type=3D"Standard - Text" version=3D"1" id=3D"O9">
> +      <dia:attribute name=3D"obj_pos">
> +        <dia:point val=3D"26.1,14.125"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"obj_bb">
> +        <dia:rectangle val=3D"26.1,13.53;30.7475,14.2775"/>
> +      </dia:attribute>
> +      <dia:attribute name=3D"text">
> +        <dia:composite type=3D"text">
> +          <dia:attribute name=3D"string">
> +            <dia:string>#source pad (0)#</dia:string>
> +          </dia:attribute>
> +          <dia:attribute name=3D"font">
> +            <dia:font family=3D"sans" style=3D"0" name=3D"Helvetica"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"height">
> +            <dia:real val=3D"0.80000000000000004"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"pos">
> +            <dia:point val=3D"26.1,14.125"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"color">
> +            <dia:color val=3D"#000000ff"/>
> +          </dia:attribute>
> +          <dia:attribute name=3D"alignment">
> +            <dia:enum val=3D"0"/>
> +          </dia:attribute>
> +        </dia:composite>
> +      </dia:attribute>
> +      <dia:attribute name=3D"valign">
> +        <dia:enum val=3D"3"/>
> +      </dia:attribute>
> +    </dia:object>
> +  </dia:layer>
> +</dia:diagram>
> diff --git a/Documentation/userspace-api/media/v4l/common-raw-sensor.svg =
b/Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> new file mode 100644
> index 000000000000..1d6055da2519
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/common-raw-sensor.svg
> @@ -0,0 +1,134 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<svg xmlns=3D"http://www.w3.org/2000/svg" xmlns:xlink=3D"http://www.w3.o=
rg/1999/xlink" width=3D"296pt" height=3D"142pt" viewBox=3D"0 0 296 142" ver=
sion=3D"1.1">
> +<defs>
> +<g>
> +<symbol overflow=3D"visible" id=3D"glyph0-0">
> +<path style=3D"stroke:none;" d=3D"M 0.640625 2.265625 L 0.640625 -9.0156=
25 L 7.03125 -9.015625 L 7.03125 2.265625 Z M 1.359375 1.546875 L 6.328125 =
1.546875 L 6.328125 -8.296875 L 1.359375 -8.296875 Z M 1.359375 1.546875 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-1">
> +<path style=3D"stroke:none;" d=3D"M 1.203125 -7 L 2.359375 -7 L 2.359375=
 0 L 1.203125 0 Z M 1.203125 -9.71875 L 2.359375 -9.71875 L 2.359375 -8.265=
625 L 1.203125 -8.265625 Z M 1.203125 -9.71875 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-2">
> +<path style=3D"stroke:none;" d=3D"M 6.65625 -5.65625 C 6.9375 -6.164062 =
7.273438 -6.546875 7.671875 -6.796875 C 8.078125 -7.046875 8.550781 -7.1718=
75 9.09375 -7.171875 C 9.820312 -7.171875 10.382812 -6.914062 10.78125 -6.4=
0625 C 11.175781 -5.894531 11.375 -5.164062 11.375 -4.21875 L 11.375 0 L 10=
=2E21875 0 L 10.21875 -4.1875 C 10.21875 -4.851562 10.097656 -5.347656 9.85=
9375 -5.671875 C 9.628906 -6.003906 9.269531 -6.171875 8.78125 -6.171875 C =
8.1875 -6.171875 7.710938 -5.972656 7.359375 -5.578125 C 7.015625 -5.179688=
 6.84375 -4.640625 6.84375 -3.953125 L 6.84375 0 L 5.6875 0 L 5.6875 -4.187=
5 C 5.6875 -4.863281 5.566406 -5.363281 5.328125 -5.6875 C 5.097656 -6.0078=
12 4.734375 -6.171875 4.234375 -6.171875 C 3.648438 -6.171875 3.179688 -5.9=
6875 2.828125 -5.5625 C 2.484375 -5.164062 2.3125 -4.628906 2.3125 -3.95312=
5 L 2.3125 0 L 1.15625 0 L 1.15625 -7 L 2.3125 -7 L 2.3125 -5.90625 C 2.582=
031 -6.332031 2.898438 -6.648438 3.265625 -6.859375 C 3.628906 -7.066406 4.=
0625 -7.171875 4.5625 -7.171875 C 5.070312 -7.171875 5.503906 -7.039062 5.8=
59375 -6.78125 C 6.222656 -6.519531 6.488281 -6.144531 6.65625 -5.65625 Z M=
 6.65625 -5.65625 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-3">
> +<path style=3D"stroke:none;" d=3D"M 4.390625 -3.515625 C 3.460938 -3.515=
625 2.816406 -3.40625 2.453125 -3.1875 C 2.097656 -2.976562 1.921875 -2.617=
188 1.921875 -2.109375 C 1.921875 -1.703125 2.050781 -1.378906 2.3125 -1.14=
0625 C 2.582031 -0.898438 2.953125 -0.78125 3.421875 -0.78125 C 4.054688 -0=
=2E78125 4.566406 -1.003906 4.953125 -1.453125 C 5.335938 -1.910156 5.53125=
 -2.515625 5.53125 -3.265625 L 5.53125 -3.515625 Z M 6.671875 -4 L 6.671875=
 0 L 5.53125 0 L 5.53125 -1.0625 C 5.269531 -0.632812 4.941406 -0.316406 4.=
546875 -0.109375 C 4.160156 0.0859375 3.679688 0.1875 3.109375 0.1875 C 2.3=
90625 0.1875 1.816406 -0.015625 1.390625 -0.421875 C 0.972656 -0.828125 0.7=
65625 -1.363281 0.765625 -2.03125 C 0.765625 -2.820312 1.023438 -3.414062 1=
=2E546875 -3.8125 C 2.078125 -4.21875 2.867188 -4.421875 3.921875 -4.421875=
 L 5.53125 -4.421875 L 5.53125 -4.53125 C 5.53125 -5.0625 5.351562 -5.46875=
 5 -5.75 C 4.65625 -6.039062 4.171875 -6.1875 3.546875 -6.1875 C 3.140625 -=
6.1875 2.75 -6.140625 2.375 -6.046875 C 2 -5.953125 1.632812 -5.8125 1.2812=
5 -5.625 L 1.28125 -6.671875 C 1.695312 -6.835938 2.101562 -6.960938 2.5 -7=
=2E046875 C 2.894531 -7.128906 3.28125 -7.171875 3.65625 -7.171875 C 4.6757=
81 -7.171875 5.429688 -6.90625 5.921875 -6.375 C 6.421875 -5.851562 6.67187=
5 -5.0625 6.671875 -4 Z M 6.671875 -4 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-4">
> +<path style=3D"stroke:none;" d=3D"M 5.8125 -3.578125 C 5.8125 -4.410156 =
5.640625 -5.054688 5.296875 -5.515625 C 4.953125 -5.972656 4.46875 -6.20312=
5 3.84375 -6.203125 C 3.226562 -6.203125 2.75 -5.972656 2.40625 -5.515625 C=
 2.0625 -5.054688 1.890625 -4.410156 1.890625 -3.578125 C 1.890625 -2.75390=
6 2.0625 -2.113281 2.40625 -1.65625 C 2.75 -1.195312 3.226562 -0.96875 3.84=
375 -0.96875 C 4.46875 -0.96875 4.953125 -1.195312 5.296875 -1.65625 C 5.64=
0625 -2.113281 5.8125 -2.753906 5.8125 -3.578125 Z M 6.953125 -0.875 C 6.95=
3125 0.320312 6.6875 1.207031 6.15625 1.78125 C 5.632812 2.363281 4.828125 =
2.65625 3.734375 2.65625 C 3.328125 2.65625 2.945312 2.625 2.59375 2.5625 C=
 2.238281 2.507812 1.890625 2.421875 1.546875 2.296875 L 1.546875 1.171875 =
C 1.890625 1.359375 2.222656 1.492188 2.546875 1.578125 C 2.878906 1.671875=
 3.21875 1.71875 3.5625 1.71875 C 4.3125 1.71875 4.875 1.519531 5.25 1.125 =
C 5.625 0.726562 5.8125 0.132812 5.8125 -0.65625 L 5.8125 -1.234375 C 5.570=
312 -0.816406 5.265625 -0.503906 4.890625 -0.296875 C 4.523438 -0.0976562 4=
=2E082031 0 3.5625 0 C 2.707031 0 2.015625 -0.328125 1.484375 -0.984375 C 0=
=2E960938 -1.640625 0.703125 -2.503906 0.703125 -3.578125 C 0.703125 -4.660=
156 0.960938 -5.53125 1.484375 -6.1875 C 2.015625 -6.84375 2.707031 -7.1718=
75 3.5625 -7.171875 C 4.082031 -7.171875 4.523438 -7.066406 4.890625 -6.859=
375 C 5.265625 -6.648438 5.570312 -6.34375 5.8125 -5.9375 L 5.8125 -7 L 6.9=
53125 -7 Z M 6.953125 -0.875 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-5">
> +<path style=3D"stroke:none;" d=3D"M 7.1875 -3.78125 L 7.1875 -3.21875 L =
1.90625 -3.21875 C 1.957031 -2.425781 2.195312 -1.820312 2.625 -1.40625 C 3=
=2E050781 -1 3.644531 -0.796875 4.40625 -0.796875 C 4.84375 -0.796875 5.269=
531 -0.847656 5.6875 -0.953125 C 6.101562 -1.066406 6.515625 -1.226562 6.92=
1875 -1.4375 L 6.921875 -0.359375 C 6.515625 -0.179688 6.09375 -0.046875 5.=
65625 0.046875 C 5.21875 0.140625 4.78125 0.1875 4.34375 0.1875 C 3.21875 0=
=2E1875 2.328125 -0.132812 1.671875 -0.78125 C 1.023438 -1.4375 0.703125 -2=
=2E320312 0.703125 -3.4375 C 0.703125 -4.582031 1.007812 -5.488281 1.625 -6=
=2E15625 C 2.25 -6.832031 3.085938 -7.171875 4.140625 -7.171875 C 5.078125 =
-7.171875 5.816406 -6.863281 6.359375 -6.25 C 6.910156 -5.644531 7.1875 -4.=
820312 7.1875 -3.78125 Z M 6.046875 -4.125 C 6.035156 -4.75 5.859375 -5.25 =
5.515625 -5.625 C 5.171875 -6 4.71875 -6.1875 4.15625 -6.1875 C 3.507812 -6=
=2E1875 2.992188 -6.003906 2.609375 -5.640625 C 2.222656 -5.285156 2 -4.781=
25 1.9375 -4.125 Z M 6.046875 -4.125 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-6">
> +<path style=3D"stroke:none;" d=3D""/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-7">
> +<path style=3D"stroke:none;" d=3D"M 5.8125 -5.9375 L 5.8125 -9.71875 L 6=
=2E953125 -9.71875 L 6.953125 0 L 5.8125 0 L 5.8125 -1.046875 C 5.570312 -0=
=2E628906 5.265625 -0.316406 4.890625 -0.109375 C 4.523438 0.0859375 4.0820=
31 0.1875 3.5625 0.1875 C 2.71875 0.1875 2.03125 -0.148438 1.5 -0.828125 C =
0.96875 -1.503906 0.703125 -2.394531 0.703125 -3.5 C 0.703125 -4.59375 0.96=
875 -5.476562 1.5 -6.15625 C 2.03125 -6.832031 2.71875 -7.171875 3.5625 -7.=
171875 C 4.082031 -7.171875 4.523438 -7.066406 4.890625 -6.859375 C 5.26562=
5 -6.660156 5.570312 -6.351562 5.8125 -5.9375 Z M 1.890625 -3.5 C 1.890625 =
-2.644531 2.0625 -1.976562 2.40625 -1.5 C 2.757812 -1.019531 3.238281 -0.78=
125 3.84375 -0.78125 C 4.457031 -0.78125 4.9375 -1.019531 5.28125 -1.5 C 5.=
632812 -1.976562 5.8125 -2.644531 5.8125 -3.5 C 5.8125 -4.34375 5.632812 -5=
=2E003906 5.28125 -5.484375 C 4.9375 -5.960938 4.457031 -6.203125 3.84375 -=
6.203125 C 3.238281 -6.203125 2.757812 -5.960938 2.40625 -5.484375 C 2.0625=
 -5.003906 1.890625 -4.34375 1.890625 -3.5 Z M 1.890625 -3.5 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-8">
> +<path style=3D"stroke:none;" d=3D"M 2.34375 -8.984375 L 2.34375 -7 L 4.7=
1875 -7 L 4.71875 -6.109375 L 2.34375 -6.109375 L 2.34375 -2.3125 C 2.34375=
 -1.738281 2.421875 -1.367188 2.578125 -1.203125 C 2.734375 -1.046875 3.050=
781 -0.96875 3.53125 -0.96875 L 4.71875 -0.96875 L 4.71875 0 L 3.53125 0 C =
2.644531 0 2.03125 -0.164062 1.6875 -0.5 C 1.351562 -0.832031 1.1875 -1.437=
5 1.1875 -2.3125 L 1.1875 -6.109375 L 0.34375 -6.109375 L 0.34375 -7 L 1.18=
75 -7 L 1.1875 -8.984375 Z M 2.34375 -8.984375 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-9">
> +<path style=3D"stroke:none;" d=3D"M 3.96875 -9.703125 C 3.40625 -8.74218=
8 2.988281 -7.796875 2.71875 -6.859375 C 2.445312 -5.929688 2.3125 -4.98437=
5 2.3125 -4.015625 C 2.3125 -3.054688 2.445312 -2.101562 2.71875 -1.15625 C=
 3 -0.21875 3.414062 0.726562 3.96875 1.6875 L 2.96875 1.6875 C 2.34375 0.7=
07031 1.875 -0.253906 1.5625 -1.203125 C 1.25 -2.148438 1.09375 -3.085938 1=
=2E09375 -4.015625 C 1.09375 -4.941406 1.25 -5.875 1.5625 -6.8125 C 1.875 -=
7.757812 2.34375 -8.722656 2.96875 -9.703125 Z M 3.96875 -9.703125 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-10">
> +<path style=3D"stroke:none;" d=3D"M 1.59375 -1.0625 L 3.65625 -1.0625 L =
3.65625 -8.171875 L 1.40625 -7.734375 L 1.40625 -8.875 L 3.640625 -9.328125=
 L 4.90625 -9.328125 L 4.90625 -1.0625 L 6.953125 -1.0625 L 6.953125 0 L 1.=
59375 0 Z M 1.59375 -1.0625 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-11">
> +<path style=3D"stroke:none;" d=3D"M 1.03125 -9.703125 L 2.03125 -9.70312=
5 C 2.65625 -8.722656 3.117188 -7.757812 3.421875 -6.8125 C 3.734375 -5.875=
 3.890625 -4.941406 3.890625 -4.015625 C 3.890625 -3.085938 3.734375 -2.148=
438 3.421875 -1.203125 C 3.117188 -0.253906 2.65625 0.707031 2.03125 1.6875=
 L 1.03125 1.6875 C 1.582031 0.726562 1.992188 -0.21875 2.265625 -1.15625 C=
 2.535156 -2.101562 2.671875 -3.054688 2.671875 -4.015625 C 2.671875 -4.984=
375 2.535156 -5.929688 2.265625 -6.859375 C 1.992188 -7.796875 1.582031 -8.=
742188 1.03125 -9.703125 Z M 1.03125 -9.703125 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-12">
> +<path style=3D"stroke:none;" d=3D"M 6.234375 -3.5 C 6.234375 -4.34375 6.=
054688 -5.003906 5.703125 -5.484375 C 5.359375 -5.960938 4.882812 -6.203125=
 4.28125 -6.203125 C 3.664062 -6.203125 3.179688 -5.960938 2.828125 -5.4843=
75 C 2.484375 -5.003906 2.3125 -4.34375 2.3125 -3.5 C 2.3125 -2.644531 2.48=
4375 -1.976562 2.828125 -1.5 C 3.179688 -1.019531 3.664062 -0.78125 4.28125=
 -0.78125 C 4.882812 -0.78125 5.359375 -1.019531 5.703125 -1.5 C 6.054688 -=
1.976562 6.234375 -2.644531 6.234375 -3.5 Z M 2.3125 -5.9375 C 2.5625 -6.35=
1562 2.867188 -6.660156 3.234375 -6.859375 C 3.597656 -7.066406 4.039062 -7=
=2E171875 4.5625 -7.171875 C 5.40625 -7.171875 6.09375 -6.832031 6.625 -6.1=
5625 C 7.15625 -5.476562 7.421875 -4.59375 7.421875 -3.5 C 7.421875 -2.3945=
31 7.15625 -1.503906 6.625 -0.828125 C 6.09375 -0.148438 5.40625 0.1875 4.5=
625 0.1875 C 4.039062 0.1875 3.597656 0.0859375 3.234375 -0.109375 C 2.8671=
88 -0.316406 2.5625 -0.628906 2.3125 -1.046875 L 2.3125 0 L 1.15625 0 L 1.1=
5625 -9.71875 L 2.3125 -9.71875 Z M 2.3125 -5.9375 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-13">
> +<path style=3D"stroke:none;" d=3D"M 2.453125 -1.0625 L 6.859375 -1.0625 =
L 6.859375 0 L 0.9375 0 L 0.9375 -1.0625 C 1.414062 -1.5625 2.066406 -2.226=
562 2.890625 -3.0625 C 3.722656 -3.894531 4.242188 -4.429688 4.453125 -4.67=
1875 C 4.859375 -5.128906 5.140625 -5.515625 5.296875 -5.828125 C 5.460938 =
-6.140625 5.546875 -6.445312 5.546875 -6.75 C 5.546875 -7.25 5.367188 -7.65=
625 5.015625 -7.96875 C 4.671875 -8.28125 4.21875 -8.4375 3.65625 -8.4375 C=
 3.257812 -8.4375 2.84375 -8.363281 2.40625 -8.21875 C 1.96875 -8.082031 1.=
5 -7.878906 1 -7.609375 L 1 -8.875 C 1.507812 -9.082031 1.984375 -9.238281 =
2.421875 -9.34375 C 2.867188 -9.445312 3.273438 -9.5 3.640625 -9.5 C 4.6093=
75 -9.5 5.378906 -9.253906 5.953125 -8.765625 C 6.523438 -8.285156 6.8125 -=
7.640625 6.8125 -6.828125 C 6.8125 -6.453125 6.738281 -6.09375 6.59375 -5.7=
5 C 6.445312 -5.40625 6.1875 -5 5.8125 -4.53125 C 5.707031 -4.40625 5.375 -=
4.054688 4.8125 -3.484375 C 4.257812 -2.910156 3.472656 -2.101562 2.453125 =
-1.0625 Z M 2.453125 -1.0625 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-14">
> +<path style=3D"stroke:none;" d=3D"M 5.671875 -6.796875 L 5.671875 -5.703=
125 C 5.347656 -5.867188 5.007812 -5.992188 4.65625 -6.078125 C 4.300781 -6=
=2E160156 3.9375 -6.203125 3.5625 -6.203125 C 3 -6.203125 2.570312 -6.11328=
1 2.28125 -5.9375 C 2 -5.769531 1.859375 -5.507812 1.859375 -5.15625 C 1.85=
9375 -4.882812 1.957031 -4.671875 2.15625 -4.515625 C 2.363281 -4.367188 2.=
773438 -4.226562 3.390625 -4.09375 L 3.78125 -4 C 4.601562 -3.832031 5.1875=
 -3.585938 5.53125 -3.265625 C 5.875 -2.941406 6.046875 -2.5 6.046875 -1.93=
75 C 6.046875 -1.28125 5.785156 -0.757812 5.265625 -0.375 C 4.753906 0 4.05=
0781 0.1875 3.15625 0.1875 C 2.78125 0.1875 2.390625 0.148438 1.984375 0.07=
8125 C 1.578125 0.00390625 1.144531 -0.101562 0.6875 -0.25 L 0.6875 -1.4375=
 C 1.113281 -1.21875 1.53125 -1.050781 1.9375 -0.9375 C 2.351562 -0.832031 =
2.765625 -0.78125 3.171875 -0.78125 C 3.710938 -0.78125 4.128906 -0.875 4.4=
21875 -1.0625 C 4.710938 -1.25 4.859375 -1.507812 4.859375 -1.84375 C 4.859=
375 -2.15625 4.753906 -2.394531 4.546875 -2.5625 C 4.335938 -2.726562 3.875=
 -2.890625 3.15625 -3.046875 L 2.765625 -3.140625 C 2.046875 -3.285156 1.53=
125 -3.515625 1.21875 -3.828125 C 0.90625 -4.140625 0.75 -4.566406 0.75 -5.=
109375 C 0.75 -5.765625 0.976562 -6.269531 1.4375 -6.625 C 1.90625 -6.98828=
1 2.570312 -7.171875 3.4375 -7.171875 C 3.851562 -7.171875 4.25 -7.140625 4=
=2E625 -7.078125 C 5 -7.015625 5.347656 -6.921875 5.671875 -6.796875 Z M 5.=
671875 -6.796875 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-15">
> +<path style=3D"stroke:none;" d=3D"M 3.921875 -6.1875 C 3.304688 -6.1875 =
2.816406 -5.945312 2.453125 -5.46875 C 2.097656 -4.988281 1.921875 -4.33203=
1 1.921875 -3.5 C 1.921875 -2.65625 2.097656 -1.992188 2.453125 -1.515625 C=
 2.804688 -1.035156 3.296875 -0.796875 3.921875 -0.796875 C 4.535156 -0.796=
875 5.019531 -1.035156 5.375 -1.515625 C 5.726562 -2.003906 5.90625 -2.6640=
62 5.90625 -3.5 C 5.90625 -4.320312 5.726562 -4.972656 5.375 -5.453125 C 5.=
019531 -5.941406 4.535156 -6.1875 3.921875 -6.1875 Z M 3.921875 -7.171875 C=
 4.921875 -7.171875 5.703125 -6.84375 6.265625 -6.1875 C 6.835938 -5.539062=
 7.125 -4.644531 7.125 -3.5 C 7.125 -2.351562 6.835938 -1.453125 6.265625 -=
0.796875 C 5.703125 -0.140625 4.921875 0.1875 3.921875 0.1875 C 2.910156 0.=
1875 2.117188 -0.140625 1.546875 -0.796875 C 0.984375 -1.453125 0.703125 -2=
=2E351562 0.703125 -3.5 C 0.703125 -4.644531 0.984375 -5.539062 1.546875 -6=
=2E1875 C 2.117188 -6.84375 2.910156 -7.171875 3.921875 -7.171875 Z M 3.921=
875 -7.171875 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-16">
> +<path style=3D"stroke:none;" d=3D"M 1.09375 -2.765625 L 1.09375 -7 L 2.2=
34375 -7 L 2.234375 -2.8125 C 2.234375 -2.144531 2.363281 -1.644531 2.625 -=
1.3125 C 2.882812 -0.976562 3.269531 -0.8125 3.78125 -0.8125 C 4.40625 -0.8=
125 4.894531 -1.007812 5.25 -1.40625 C 5.613281 -1.800781 5.796875 -2.34375=
 5.796875 -3.03125 L 5.796875 -7 L 6.953125 -7 L 6.953125 0 L 5.796875 0 L =
5.796875 -1.078125 C 5.515625 -0.648438 5.191406 -0.332031 4.828125 -0.125 =
C 4.460938 0.0820312 4.035156 0.1875 3.546875 0.1875 C 2.742188 0.1875 2.13=
2812 -0.0625 1.71875 -0.5625 C 1.300781 -1.0625 1.09375 -1.796875 1.09375 -=
2.765625 Z M 3.984375 -7.171875 Z M 3.984375 -7.171875 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-17">
> +<path style=3D"stroke:none;" d=3D"M 5.265625 -5.921875 C 5.128906 -5.992=
188 4.984375 -6.046875 4.828125 -6.078125 C 4.679688 -6.117188 4.519531 -6.=
140625 4.34375 -6.140625 C 3.6875 -6.140625 3.179688 -5.925781 2.828125 -5.=
5 C 2.484375 -5.082031 2.3125 -4.476562 2.3125 -3.6875 L 2.3125 0 L 1.15625=
 0 L 1.15625 -7 L 2.3125 -7 L 2.3125 -5.90625 C 2.5625 -6.332031 2.878906 -=
6.648438 3.265625 -6.859375 C 3.648438 -7.066406 4.117188 -7.171875 4.67187=
5 -7.171875 C 4.753906 -7.171875 4.84375 -7.164062 4.9375 -7.15625 C 5.0312=
5 -7.144531 5.132812 -7.128906 5.25 -7.109375 Z M 5.265625 -5.921875 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-18">
> +<path style=3D"stroke:none;" d=3D"M 6.25 -6.734375 L 6.25 -5.65625 C 5.9=
14062 -5.832031 5.585938 -5.960938 5.265625 -6.046875 C 4.941406 -6.140625 =
4.613281 -6.1875 4.28125 -6.1875 C 3.53125 -6.1875 2.945312 -5.953125 2.531=
25 -5.484375 C 2.125 -5.015625 1.921875 -4.351562 1.921875 -3.5 C 1.921875 =
-2.644531 2.125 -1.976562 2.53125 -1.5 C 2.945312 -1.03125 3.53125 -0.79687=
5 4.28125 -0.796875 C 4.613281 -0.796875 4.941406 -0.835938 5.265625 -0.921=
875 C 5.585938 -1.015625 5.914062 -1.148438 6.25 -1.328125 L 6.25 -0.265625=
 C 5.925781 -0.117188 5.59375 -0.0078125 5.25 0.0625 C 4.90625 0.144531 4.5=
39062 0.1875 4.15625 0.1875 C 3.09375 0.1875 2.25 -0.144531 1.625 -0.8125 C=
 1.007812 -1.476562 0.703125 -2.375 0.703125 -3.5 C 0.703125 -4.632812 1.01=
5625 -5.53125 1.640625 -6.1875 C 2.273438 -6.84375 3.132812 -7.171875 4.218=
75 -7.171875 C 4.570312 -7.171875 4.914062 -7.132812 5.25 -7.0625 C 5.59375=
 -6.988281 5.925781 -6.878906 6.25 -6.734375 Z M 6.25 -6.734375 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-19">
> +<path style=3D"stroke:none;" d=3D"M 2.3125 -1.046875 L 2.3125 2.65625 L =
1.15625 2.65625 L 1.15625 -7 L 2.3125 -7 L 2.3125 -5.9375 C 2.5625 -6.35156=
2 2.867188 -6.660156 3.234375 -6.859375 C 3.597656 -7.066406 4.039062 -7.17=
1875 4.5625 -7.171875 C 5.40625 -7.171875 6.09375 -6.832031 6.625 -6.15625 =
C 7.15625 -5.476562 7.421875 -4.59375 7.421875 -3.5 C 7.421875 -2.394531 7.=
15625 -1.503906 6.625 -0.828125 C 6.09375 -0.148438 5.40625 0.1875 4.5625 0=
=2E1875 C 4.039062 0.1875 3.597656 0.0859375 3.234375 -0.109375 C 2.867188 =
-0.316406 2.5625 -0.628906 2.3125 -1.046875 Z M 6.234375 -3.5 C 6.234375 -4=
=2E34375 6.054688 -5.003906 5.703125 -5.484375 C 5.359375 -5.960938 4.88281=
2 -6.203125 4.28125 -6.203125 C 3.664062 -6.203125 3.179688 -5.960938 2.828=
125 -5.484375 C 2.484375 -5.003906 2.3125 -4.34375 2.3125 -3.5 C 2.3125 -2.=
644531 2.484375 -1.976562 2.828125 -1.5 C 3.179688 -1.019531 3.664062 -0.78=
125 4.28125 -0.78125 C 4.882812 -0.78125 5.359375 -1.019531 5.703125 -1.5 C=
 6.054688 -1.976562 6.234375 -2.644531 6.234375 -3.5 Z M 6.234375 -3.5 "/>
> +</symbol>
> +<symbol overflow=3D"visible" id=3D"glyph0-20">
> +<path style=3D"stroke:none;" d=3D"M 4.0625 -8.5 C 3.414062 -8.5 2.925781=
 -8.175781 2.59375 -7.53125 C 2.269531 -6.894531 2.109375 -5.9375 2.109375 =
-4.65625 C 2.109375 -3.375 2.269531 -2.410156 2.59375 -1.765625 C 2.925781 =
-1.128906 3.414062 -0.8125 4.0625 -0.8125 C 4.71875 -0.8125 5.207031 -1.128=
906 5.53125 -1.765625 C 5.863281 -2.410156 6.03125 -3.375 6.03125 -4.65625 =
C 6.03125 -5.9375 5.863281 -6.894531 5.53125 -7.53125 C 5.207031 -8.175781 =
4.71875 -8.5 4.0625 -8.5 Z M 4.0625 -9.5 C 5.113281 -9.5 5.914062 -9.082031=
 6.46875 -8.25 C 7.019531 -7.425781 7.296875 -6.226562 7.296875 -4.65625 C =
7.296875 -3.082031 7.019531 -1.878906 6.46875 -1.046875 C 5.914062 -0.22265=
6 5.113281 0.1875 4.0625 0.1875 C 3.019531 0.1875 2.222656 -0.222656 1.6718=
75 -1.046875 C 1.117188 -1.878906 0.84375 -3.082031 0.84375 -4.65625 C 0.84=
375 -6.226562 1.117188 -7.425781 1.671875 -8.25 C 2.222656 -9.082031 3.0195=
31 -9.5 4.0625 -9.5 Z M 4.0625 -9.5 "/>
> +</symbol>
> +</g>
> +</defs>
> +<g id=3D"surface11910">
> +<rect x=3D"0" y=3D"0" width=3D"296" height=3D"142" style=3D"fill:rgb(100=
%,100%,100%);fill-opacity:1;stroke:none;"/>
> +<path style=3D"fill-rule:evenodd;fill:rgb(100%,100%,100%);fill-opacity:1=
;stroke-width:0.1;stroke-linecap:butt;stroke-linejoin:miter;stroke:rgb(0%,0=
%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=3D"M 16.35 11.5 L 25.75 11.=
5 L 25.75 18.4 L 16.35 18.4 Z M 16.35 11.5 " transform=3D"matrix(20,0,0,20,=
-325,-228)"/>
> +<path style=3D"fill-rule:evenodd;fill:rgb(100%,100%,100%);fill-opacity:1=
;stroke-width:0.1;stroke-linecap:butt;stroke-linejoin:miter;stroke:rgb(0%,0=
%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=3D"M 25.919141 14.75625 C 2=
5.919141 14.99375 25.562695 14.99375 25.562695 14.75625 C 25.562695 14.5185=
55 25.919141 14.518555 25.919141 14.75625 " transform=3D"matrix(20,0,0,20,-=
325,-228)"/>
> +<path style=3D"fill-rule:evenodd;fill:rgb(100%,100%,100%);fill-opacity:1=
;stroke-width:0.1;stroke-linecap:butt;stroke-linejoin:miter;stroke:rgb(0%,0=
%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=3D"M 18.140039 13.450586 C =
18.140039 13.69707 17.770117 13.69707 17.770117 13.450586 C 17.770117 13.20=
3906 18.140039 13.203906 18.140039 13.450586 " transform=3D"matrix(20,0,0,2=
0,-325,-228)"/>
> +<path style=3D"fill-rule:evenodd;fill:rgb(100%,100%,100%);fill-opacity:1=
;stroke-width:0.1;stroke-linecap:butt;stroke-linejoin:miter;stroke:rgb(0%,0=
%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=3D"M 18.116211 16.39043 C 1=
8.116211 16.637109 17.746484 16.637109 17.746484 16.39043 C 17.746484 16.14=
3945 18.116211 16.143945 18.116211 16.39043 " transform=3D"matrix(20,0,0,20=
,-325,-228)"/>
> +<path style=3D"fill:none;stroke-width:0.1;stroke-linecap:butt;stroke-lin=
ejoin:miter;stroke:rgb(0%,0%,0%);stroke-opacity:1;stroke-dasharray:1,1;stro=
ke-miterlimit:10;" d=3D"M 18.160937 16.341406 L 25.344141 14.80293 " transf=
orm=3D"matrix(20,0,0,20,-325,-228)"/>
> +<path style=3D"fill:none;stroke-width:0.1;stroke-linecap:butt;stroke-lin=
ejoin:miter;stroke:rgb(0%,0%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=
=3D"M 25.016797 15.128711 L 25.45332 14.779687 L 24.912109 14.639844 " tran=
sform=3D"matrix(20,0,0,20,-325,-228)"/>
> +<path style=3D"fill:none;stroke-width:0.1;stroke-linecap:butt;stroke-lin=
ejoin:miter;stroke:rgb(0%,0%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=
=3D"M 18.140039 13.450586 L 25.342383 14.717383 " transform=3D"matrix(20,0,=
0,20,-325,-228)"/>
> +<path style=3D"fill:none;stroke-width:0.1;stroke-linecap:butt;stroke-lin=
ejoin:miter;stroke:rgb(0%,0%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=
=3D"M 24.916797 14.896484 L 25.452539 14.736914 L 25.003516 14.403906 " tra=
nsform=3D"matrix(20,0,0,20,-325,-228)"/>
> +<path style=3D"fill:none;stroke-width:0.1;stroke-linecap:butt;stroke-lin=
ejoin:miter;stroke:rgb(0%,0%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=
=3D"M 25.918945 14.75625 L 30.732813 14.715039 " transform=3D"matrix(20,0,0=
,20,-325,-228)"/>
> +<path style=3D"fill:none;stroke-width:0.1;stroke-linecap:butt;stroke-lin=
ejoin:miter;stroke:rgb(0%,0%,0%);stroke-opacity:1;stroke-miterlimit:10;" d=
=3D"M 30.34668 14.968359 L 30.844531 14.714062 L 30.342383 14.468359 " tran=
sform=3D"matrix(20,0,0,20,-325,-228)"/>
> +<g style=3D"fill:rgb(0%,0%,0%);fill-opacity:1;">
> +  <use xlink:href=3D"#glyph0-1" x=3D"34.101562" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-2" x=3D"37.712674" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-3" x=3D"50.212674" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-4" x=3D"57.990451" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-5" x=3D"66.046007" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-6" x=3D"73.823785" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-7" x=3D"77.990451" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-3" x=3D"86.046007" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-8" x=3D"93.823785" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-3" x=3D"98.823785" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-6" x=3D"106.601562" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-9" x=3D"110.768229" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-10" x=3D"115.768229" y=3D"34.267687"/>
> +  <use xlink:href=3D"#glyph0-11" x=3D"123.823785" y=3D"34.267687"/>
> +</g>
> +<g style=3D"fill:rgb(0%,0%,0%);fill-opacity:1;">
> +  <use xlink:href=3D"#glyph0-5" x=3D"33.625" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-2" x=3D"41.402778" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-12" x=3D"53.902778" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-5" x=3D"61.958333" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-7" x=3D"69.736111" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-7" x=3D"77.791667" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-5" x=3D"85.847222" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-7" x=3D"93.625" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-6" x=3D"101.680556" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-7" x=3D"105.847222" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-3" x=3D"113.902778" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-8" x=3D"121.680556" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-3" x=3D"126.680556" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-6" x=3D"134.458333" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-9" x=3D"138.625" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-13" x=3D"143.625" y=3D"115.412218"/>
> +  <use xlink:href=3D"#glyph0-11" x=3D"151.680556" y=3D"115.412218"/>
> +</g>
> +<g style=3D"fill:rgb(0%,0%,0%);fill-opacity:1;">
> +  <use xlink:href=3D"#glyph0-14" x=3D"197" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-15" x=3D"203.666667" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-16" x=3D"211.444444" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-17" x=3D"219.5" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-18" x=3D"224.5" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-5" x=3D"231.444444" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-6" x=3D"239.222222" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-19" x=3D"243.388889" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-3" x=3D"251.444444" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-7" x=3D"259.222222" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-6" x=3D"267.277778" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-9" x=3D"271.444444" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-20" x=3D"276.444444" y=3D"54.505968"/>
> +  <use xlink:href=3D"#glyph0-11" x=3D"284.5" y=3D"54.505968"/>
> +</g>
> +</g>
> +</svg>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Docum=
entation/userspace-api/media/v4l/dev-subdev.rst
> index 835e910d4391..eccb05dbe290 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -842,3 +842,5 @@ stream while it may be possible to enable and disable=
 the embedded data stream.
>
>  The embedded data format does not need to be configured on the sensor's =
pads as
>  the format is dictated by the pixel data format in this case.
> +
> +.. include:: subdev-config-model.rst
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rs=
t b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> new file mode 100644
> index 000000000000..1e6c58931ea0
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -0,0 +1,230 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +.. _media_subdev_config_model:
> +
> +Sub-device configuration models
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +The V4L2 specification defines a subdev API that exposes three type of
> +configuration elements: formats, selection rectangles and controls. The
> +specification contains generic information about how those configuration
> +elements behave, but not precisely how they apply to particular hardware
> +features. We leave some leeway to drivers to decide how to map selection
> +rectangles to device features, as long as they comply with the V4L2
> +specification. This is needed as hardware features differ between device=
s, so
> +it's the driver's responsibility to handle this mapping.
> +
> +Unfortunately, this lack of clearly defined mapping in the specification=
 has led
> +to different drivers mapping the same hardware features to different API
> +elements, or implementing the API elements with slightly different
> +behaviours. Furthermore, many drivers have implemented selection rectang=
les in
> +ways that do not comply with the V4L2 specification. All of this makes u=
serspace
> +development difficult.
> +
> +Sub-device configuration models specify in detail what the user space ca=
n expect
> +from a sub-device in terms of V4L2 sub-device interface support, semanti=
cs
> +included.
> +
> +A sub-device may implement more than one configuration model at the same
> +time. The implemented configuration models can be obtained from the sub-=
device's
> +``V4L2_CID_CONFIG_MODEL`` control.
> +
> +.. _media_subdev_config_model_common_raw_sensor:
> +
> +Common raw camera sensor model
> +------------------------------
> +
> +The common raw camera sensor model defines a set of enumeration and
> +configuration interfaces (formats, selections etc.) that cover the vast =
majority
> +of functionality of raw camera sensors. Not all of the interfaces are
> +necessarily offered by all drivers.
> +
> +A sub-device complies with the common raw sensor model if the
> +``V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR`` bit is set in the
> +``V4L2_CID_CONFIG_MODEL`` control of the sub-device.
> +
> +The common raw camera sensor model is aligned with
> +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding=
 aspects
> +not specified here.
> +
> +Each camera sensor implementing the common raw sensor model exposes a si=
ngle
> +V4L2 sub-device. The sub-device contains a single source pad (0) and two=
 or more
> +internal pads: one or more image data internal pads (starting from 1) and
> +optionally an embedded data pad.
> +
> +Additionally, further internal pads may be supported for other features.=
 Using
> +more than one image data internal pad or more than one non-image data pad
> +requires these pads documented separately for the given device. The indi=
ces of
> +the image data internal pads shall be lower than those of the non-image =
data
> +pads.
> +
> +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subde=
v`.
> +
> +.. _media_subdev_config_model_common_raw_sensor_subdev:
> +
> +.. kernel-figure:: common-raw-sensor.svg
> +    :alt:    common-raw-sensor.svg
> +    :align:  center
> +
> +    **Common raw sensor sub-device with n pads (n =3D=3D 2)**

Can we just say "2 pads" ? :)

> +
> +Routes
> +^^^^^^
> +
> +A sub-device conforming to common raw camera sensor model implements the
> +following routes.
> +
> +.. flat-table:: Routes
> +    :header-rows: 1
> +
> +    * - Sink pad/stream
> +      - Source pad/stream
> +      - Static (X/M(aybe)/-)
> +      - Mandatory (X/-)
> +      - Synopsis
> +    * - 1/0
> +      - 0/0
> +      - X
> +      - X
> +      - Image data
> +    * - 2/0
> +      - 0/1
> +      - M
> +      - \-
> +      - Embedded data
> +
> +Support for the embedded data stream is optional. Drivers supporting the
> +embedded data stream may allow disabling and enabling the route when the
> +streaming is disabled.
> +
> +Sensor pixel array size, cropping and binning
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The sensor's pixel array is divided into one or more areas. The areas ar=
ound the
> +edge of the pixel array, usually one or more sides, may contain optical =
black
> +pixels, dummy pixels and other non-image pixels. The entire pixel array =
size is
> +conveyed by the format on (pad, stream) pair 1/0.
> +
> +A rectangle within the pixel array contains the visible pixels. Capturin=
g the
> +non-visible pixels outside the visible pixel area may be supported by the
> +sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DE=
FAULT``
> +selection target on (pad, stream) pair 1/0.
> +
> +Sensors can perform multiple operations that affect the output image siz=
e. First
> +of these is the analogue crop. Analogue crop limits the area of the pixe=
l array
> +which the sensor will read, affecting sensor timing as well. The granula=
rity of
> +the analogue crop configuration varies greatly across sensors: some sens=
ors
> +support only a few different analogue crop configurations whereas others=
 may
> +support anything divisible by a given number of pixels. The analogue crop
> +configuration corresponds to the ``V4L2_SEL_TGT_CROP`` selection target =
on (pad,
> +stream) pair 1/0. The default analogue crop rectangle corresponds to the=
 visible
> +pixel area.
> +
> +In the next step, binning is performed on the image data read from camera
> +sensor's pixel array, as determined by the analogue crop configuration. =
Enabling
> +binning will effectively result in an image smaller than the original by=
 given
> +binning factors horizontally and vertically. Typical values are 1/2 and =
1/3 but
> +others may well be supported by the hardware as well.
> +
> +Sub-sampling follows binning. Sub-sampling, like binning, reduces the si=
ze of
> +the image by including only a subset of samples read from the sensor's p=
ixel
> +matrix, typically every n'th pixel horizontally and vertically, taking t=
he
> +sensor's color pattern into account. Sub-sampling is generally configura=
ble
> +separately horizontally and vertically.
> +
> +Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE=
``
> +rectangle, relative to the analogue crop rectangle, on (pad, stream) pair
> +1/0. The driver implementation determines how to configure binning and
> +sub-sampling to achieve the desired size.
> +
> +The digital crop operation takes place after binning and sub-sampling. I=
t is
> +configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, strea=
m) pair
> +0/0. The resulting image size is further output by the sensor.
> +
> +The sensor's output mbus code is configured by setting the format on the=
 (pad,
> +stream) pair 0/0. When setting the format, always use the same width and=
 height
> +as for the digital crop setting.
> +
> +Drivers may only support some or even none of these configurations, in w=
hich
> +case they do not expose the corresponding selection rectangles. If any s=
election
> +targets are omitted, the further selection rectangle or format is instead
> +related to the previous implemented selection rectangle. For instance, i=
f the
> +sensor supports binning but not analogue crop, then the binning configur=
ation
> +(``V4L2_SEL_TGT_COMPOSE`` selection target) is done in relation to the v=
isible
> +pixel area (``V4L2_SEL_TGT_CROP_DEFAULT`` selection target).
> +
> +Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> +
> +.. flat-table:: Selection targets on pads
> +    :header-rows: 1
> +
> +    * - Pad/Stream
> +      - Selection target/format
> +      - Mandatory (X/-)
> +      - Modifiable (X/-)
> +      - Synopsis
> +    * - 1/0
> +      - Format
> +      - X
> +      - \-
> +      - Image data format. The width and the height fields indicates the=
 full
> +        size of the pixel array, including non-visible pixels. The media=
 bus
> +        code of this format reflects the native pixel depth of the senso=
r.
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_CROP_DEFAULT``
> +      - X
> +      - \

Other entries have an hyphen here

         - \-

Is the fact that it's missing here intentional ?

nitpicks apart
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +      - The visible pixel area. This rectangle is relative to the format=
 on the
> +        same (pad, stream).
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_CROP``
> +      - \-
> +      - X
> +      - Analogue crop. Analogue crop typically has a coarse granularity.=
 This
> +        rectangle is relative to the format on the same (pad, stream).
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_COMPOSE``
> +      - \-
> +      - X
> +      - Binning and sub-sampling. This rectangle is relative to the
> +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> +        combination of binning and sub-sampling is configured using this
> +        selection target.
> +    * - 2/0
> +      - Format
> +      - X
> +      - \-
> +      - Embedded data format.
> +    * - 0/0
> +      - ``V4L2_SEL_TGT_CROP``
> +      - \-
> +      - X
> +      - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_C=
OMPOSE``
> +        rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - Format
> +      - X
> +      - X
> +      - Image data source format. Always assign the width and height fie=
lds of
> +        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> +        rectangle on (pad, stream) pair 0/0. The media bus code reflects=
 the
> +        pixel data output of the sensor.
> +    * - 0/1
> +      - Format
> +      - X
> +      - \-
> +      - Embedded data source format.
> +
> +Embedded data
> +^^^^^^^^^^^^^
> +
> +The embedded data stream is produced by the sensor when the correspondin=
g route
> +is enabled. The embedded data route may also be immutable or not exist a=
t all,
> +in case the sensor (or the driver) does not support it.
> +
> +Generally the sensor embedded data width is determined by the width of t=
he image
> +data whereas the number of lines are constant for the embedded data. The=
 user
> +space may obtain the size of the embedded data once the image data size =
on the
> +source pad has been configured.
> +
> +Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
> --
> 2.39.5
>
>


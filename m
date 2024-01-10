Return-Path: <linux-media+bounces-3465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F0829A90
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 13:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54C201C25262
	for <lists+linux-media@lfdr.de>; Wed, 10 Jan 2024 12:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD05C482E1;
	Wed, 10 Jan 2024 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK474F6B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E3B482C5
	for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2814fa68eeso331021866b.1
        for <linux-media@vger.kernel.org>; Wed, 10 Jan 2024 04:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704890829; x=1705495629; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RiNCAuE0AmW1Qx4fUCeZdcws3M+8T9Wl5ljkkxuFZAg=;
        b=XK474F6BCZjfKqJ9/wgiD/w2yh+8XQB/isADTYjRetblO44s3+2olrIXSO83ObTqMD
         24oXCnVbwbphA0vrtwhxt2E2mnwR8NPm+nmV1TExud9U19L0coHb1FJGh469PPR73N+h
         jVP7tHU9C84arAh+ljCkfLEXSGp3cT5hrQz1/DQfdhO2JyIrItKmJz3iXA0ZsWUVKRXc
         YgeFT0IVQSzY1W3KmPN/pRiRBwQP0AJeXA/KlMFAnRN7+gY2WiZr5tATlDgVHS1l6F1M
         SQtdlyDnUwIWJ4iP5cSrNHTgAIzSwW08ZgPY3hzMOHUNmtiB9MT0y0wgPiRTTpygE1ZF
         gFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704890829; x=1705495629;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiNCAuE0AmW1Qx4fUCeZdcws3M+8T9Wl5ljkkxuFZAg=;
        b=sgKc8hLb3+3csd3gaKDA6ACaS+4hLcqF+B2D+ZNSbOs3OAOyu/QvcVtrPh9FJr52Ha
         6G2I3ifxu8M8shKiiQytRK3Icb12r4cSi/3ORP0syeNrVvUcAOjfTB29N18sro38SDXE
         6a54hBPQHv3lzyu65UfzID4I8RmuFOcsJd8HstPGx+7eIqVfNcRDk4ivasvwKxtPinIc
         P3LfodOV8MM0q8ME2i/AU654TPb7Q2mv5VmiquFledjRaWizBrYN3sPFs1XqMdWCyFwH
         mkY1S/9UjOYJRGgtCukHThDFGhzTnB0KpCy+BgxZP8TiDI20Muxr1iM6Li1tP8cStCNT
         13kQ==
X-Gm-Message-State: AOJu0YzYo1UreZ+SQZXylbn0XAPfnPTyG6i8CME+K5/wqAJPXOR8uRe8
	aoq/C8B7y14AcnLgtQkY/3gaWqGZtDN0vg==
X-Google-Smtp-Source: AGHT+IFxfhY02GtVOnUxDed8n5r4vdlhrehAHQ0JoqBo7wfwNbmbWqCuK5XH1Q1fJVVXlEbe0gXylA==
X-Received: by 2002:a17:906:6d83:b0:a27:af7:bba5 with SMTP id h3-20020a1709066d8300b00a270af7bba5mr625904ejt.22.1704890829251;
        Wed, 10 Jan 2024 04:47:09 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id le15-20020a170907170f00b00a2a0212cfe1sm2041117ejc.50.2024.01.10.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 04:47:08 -0800 (PST)
Message-ID: <88416959ba28670efc3018446a241b6f45839d31.camel@gmail.com>
Subject: Re: [PATCH v2 10/15] media: intel/ipu6: add input system driver
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: bingbu.cao@intel.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tfiga@chromium.org,  senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com,  bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
Date: Wed, 10 Jan 2024 13:47:07 +0100
In-Reply-To: <20231024112924.3934228-11-bingbu.cao@intel.com>
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
	 <20231024112924.3934228-11-bingbu.cao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bingbu,

On Tue, 2023-10-24 at 19:29 +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
>=20
> Input system driver do basic isys hardware setup and irq handling
> and work with fwnode and v4l2 to register the ISYS v4l2 devices.
>=20
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reported-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 1345 ++++++++++++++++++++++
>  drivers/media/pci/intel/ipu6/ipu6-isys.h |  201 ++++
>  2 files changed, 1546 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.c
>  create mode 100644 drivers/media/pci/intel/ipu6/ipu6-isys.h
>=20
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci=
/intel/ipu6/ipu6-isys.c
> new file mode 100644
> index 000000000000..2ea0c9ad6f16
> --- /dev/null
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c

...

> +struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream=
)
> +{
> +	struct ipu6_isys *isys =3D stream->isys;
> +	struct device *dev =3D &isys->adev->auxdev.dev;
> +	struct isys_fw_msgs *msg;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&isys->listlock, flags);
> +	if (list_empty(&isys->framebuflist)) {
> +		spin_unlock_irqrestore(&isys->listlock, flags);
> +		dev_dbg(dev, "Frame list empty\n");
> +
> +		ret =3D alloc_fw_msg_bufs(isys, 5);
> +		if (ret < 0)
> +			return NULL;
> +
> +		spin_lock_irqsave(&isys->listlock, flags);
> +		if (list_empty(&isys->framebuflist)) {
> +			spin_unlock_irqrestore(&isys->listlock, flags);
> +			dev_err(dev, "Frame list empty\n");
> +			return NULL;
> +		}
> +	}
> +	msg =3D list_last_entry(&isys->framebuflist, struct isys_fw_msgs, head)=
;
> +	list_move(&msg->head, &isys->framebuflist_fw);
> +	spin_unlock_irqrestore(&isys->listlock, flags);
> +	memset(&msg->fw_msg, 0, sizeof(msg->fw_msg));
> +
> +	return msg;
> +}
> +
> +void ipu6_cleanup_fw_msg_bufs(struct ipu6_isys *isys)
> +{
> +	struct isys_fw_msgs *fwmsg, *fwmsg0;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&isys->listlock, flags);
> +	list_for_each_entry_safe(fwmsg, fwmsg0, &isys->framebuflist_fw, head)
> +		list_move(&fwmsg->head, &isys->framebuflist);
> +	spin_unlock_irqrestore(&isys->listlock, flags);
> +}
> +
> +void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, u64 data)
> +{
> +	struct isys_fw_msgs *msg;
> +	unsigned long flags;
> +	u64 *ptr =3D (u64 *)data;
> +
> +	if (!ptr)
> +		return;
> +
> +	spin_lock_irqsave(&isys->listlock, flags);
> +	msg =3D container_of(ptr, struct isys_fw_msgs, fw_msg.dummy);

The dummy field is only there to do this container_of, but ptr and msg
point to the same address, since the union dummy is in is the first
field. So the container_of is exactly the same as simply casting the
pointer.

> +	list_move(&msg->head, &isys->framebuflist);
> +	spin_unlock_irqrestore(&isys->listlock, flags);
> +}
...

> +static int isys_isr_one(struct ipu6_bus_device *adev)
> +{
> +	struct ipu6_isys *isys =3D ipu6_bus_get_drvdata(adev);
> +	struct ipu6_fw_isys_resp_info_abi *resp;
> +	struct ipu6_isys_stream *stream;
> +	struct ipu6_isys_csi2 *csi2 =3D NULL;
> +	u64 ts;
> +
> +	if (!isys->fwcom)
> +		return 1;
> +
> +	resp =3D ipu6_fw_isys_get_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
> +	if (!resp)
> +		return 1;
> +
> +	ts =3D (u64)resp->timestamp[1] << 32 | resp->timestamp[0];
> +
> +	if (resp->error_info.error =3D=3D IPU6_FW_ISYS_ERROR_STREAM_IN_SUSPENSI=
ON)
> +		/* Suspension is kind of special case: not enough buffers */
> +		dev_dbg(&adev->auxdev.dev,
> +			"FW error resp %02d %s, stream %u, error SUSPENSION, details %d, time=
stamp 0x%16.16llx, pin %d\n",
> +			resp->type,
> +			fw_msg[resp_type_to_index(resp->type)].msg,
> +			resp->stream_handle,
> +			resp->error_info.error_details,
> +			fw_msg[resp_type_to_index(resp->type)].valid_ts ?
> +			ts : 0, resp->pin_id);
> +	else if (resp->error_info.error)
> +		dev_dbg(&adev->auxdev.dev,
> +			"FW error resp %02d %s, stream %u, error %d, details %d, timestamp 0x=
%16.16llx, pin %d\n",
> +			resp->type,
> +			fw_msg[resp_type_to_index(resp->type)].msg,
> +			resp->stream_handle,
> +			resp->error_info.error, resp->error_info.error_details,
> +			fw_msg[resp_type_to_index(resp->type)].valid_ts ?
> +			ts : 0, resp->pin_id);
> +	else
> +		dev_dbg(&adev->auxdev.dev,
> +			"FW resp %02d %s, stream %u, timestamp 0x%16.16llx, pin %d\n",
> +			resp->type,
> +			fw_msg[resp_type_to_index(resp->type)].msg,
> +			resp->stream_handle,
> +			fw_msg[resp_type_to_index(resp->type)].valid_ts ?
> +			ts : 0, resp->pin_id);
> +
> +	if (resp->stream_handle >=3D IPU6_ISYS_MAX_STREAMS) {
> +		dev_err(&adev->auxdev.dev, "bad stream handle %u\n",
> +			resp->stream_handle);
> +		goto leave;
> +	}
> +
> +	stream =3D ipu6_isys_query_stream_by_handle(isys, resp->stream_handle);
> +	if (!stream) {
> +		dev_err(&adev->auxdev.dev, "stream of stream_handle %u is unused\n",
> +			resp->stream_handle);
> +		goto leave;
> +	}
> +	stream->error =3D resp->error_info.error;
> +
> +	csi2 =3D ipu6_isys_subdev_to_csi2(stream->asd);
> +
> +	switch (resp->type) {
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_OPEN_DONE:
> +		complete(&stream->stream_open_completion);
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CLOSE_ACK:
> +		complete(&stream->stream_close_completion);
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_ACK:
> +		complete(&stream->stream_start_completion);
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
> +		complete(&stream->stream_start_completion);
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_STOP_ACK:
> +		complete(&stream->stream_stop_completion);
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_FLUSH_ACK:
> +		complete(&stream->stream_stop_completion);
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_PIN_DATA_READY:
> +		/*
> +		 * firmware only release the capture msg until software
> +		 * get pin_data_ready event
> +		 */
> +		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), resp->buf_id);

Is there a difference between IPU4 and IPU6 here? `buf_id` is always 0
on IPU4, so this doesn't release anything.

The PIN_DATA_READY response is sent multiple times per call to
ipu6_get_fw_msg_buf, so if I'm not mistaken, this can only be correct
if the firmware only sends the buf_id in one of the PIN_DATA_READY
responses.

The correct pointer to release seems to be passed in the various _ACK
responses on IPU4. I think it would make a lot more sense to release
the buffer there. But of course, if there is a bug in the firmware we
might have to do something else.

> +		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
> +		    stream->output_pins[resp->pin_id].pin_ready)
> +			stream->output_pins[resp->pin_id].pin_ready(stream,
> +								    resp);
> +		else
> +			dev_warn(&adev->auxdev.dev,
> +				 "%d:No data pin ready handler for pin id %d\n",
> +				 resp->stream_handle, resp->pin_id);
> +		if (csi2)
> +			ipu6_isys_csi2_error(csi2);
> +
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_ACK:
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
> +	case IPU6_FW_ISYS_RESP_TYPE_STREAM_CAPTURE_DONE:
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_FRAME_SOF:
> +
> +		ipu6_isys_csi2_sof_event_by_stream(stream);
> +		stream->seq[stream->seq_index].sequence =3D
> +			atomic_read(&stream->sequence) - 1;
> +		stream->seq[stream->seq_index].timestamp =3D ts;
> +		dev_dbg(&adev->auxdev.dev,
> +			"sof: handle %d: (index %u), timestamp 0x%16.16llx\n",
> +			resp->stream_handle,
> +			stream->seq[stream->seq_index].sequence, ts);
> +		stream->seq_index =3D (stream->seq_index + 1)
> +			% IPU6_ISYS_MAX_PARALLEL_SOF;
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_FRAME_EOF:
> +		ipu6_isys_csi2_eof_event_by_stream(stream);
> +		dev_dbg(&adev->auxdev.dev,
> +			"eof: handle %d: (index %u), timestamp 0x%16.16llx\n",
> +			resp->stream_handle,
> +			stream->seq[stream->seq_index].sequence, ts);
> +		break;
> +	case IPU6_FW_ISYS_RESP_TYPE_STATS_DATA_READY:
> +		break;
> +	default:
> +		dev_err(&adev->auxdev.dev, "%d:unknown response type %u\n",
> +			resp->stream_handle, resp->type);
> +		break;
> +	}
> +
> +	ipu6_isys_put_stream(stream);
> +leave:
> +	ipu6_fw_isys_put_resp(isys->fwcom, IPU6_BASE_MSG_RECV_QUEUES);
> +	return 0;
> +}
...
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
...
> +struct isys_fw_msgs {
> +	union {
> +		u64 dummy;
> +		struct ipu6_fw_isys_frame_buff_set_abi frame;
> +		struct ipu6_fw_isys_stream_cfg_data_abi stream;
> +	} fw_msg;
> +	struct list_head head;
> +	dma_addr_t dma_addr;
> +};
> +
> +struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct ipu6_isys_stream *stream=
);
> +void ipu6_put_fw_msg_buf(struct ipu6_isys *isys, u64 data);

I it would be easier to understand these functions if the
ipu6_put_fw_msg_buf function, took the same type that the get function
returns.=20

/Andreas


